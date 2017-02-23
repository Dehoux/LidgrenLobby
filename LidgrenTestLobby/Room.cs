﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using Lidgren.Network;
using LudimoLibrary.Core.World;
using Microsoft.Win32;

namespace LidgrenTestLobby
{
    class Room
    {
        public int Id;
        public List<Player> Players;
        public string Name = "TestRoom";
        public List<string> RoomConsole;
        public TextBox LogOutputBox;

        public WorldData WorldData;

        private bool _roomAlive;
        private Task _roomLoopTask;

        public Room()
        {
            Players = new List<Player>();
            RoomConsole = new List<string>();

            _roomLoopTask = new Task(RunRoomLoop);
            _roomLoopTask.Start();

            WorldData = FileManager.Load<WorldData>("saves/serverWorld.world");
        }

        public void DestroyRoom()
        {
            _roomAlive = false;
            _roomLoopTask?.Wait();
        }

        private async void RunRoomLoop()
        {
            int sendRate = 1000 / 66; // 1 sec = 1000ms as Sleep uses ms.
            for (_roomAlive = true; _roomAlive; await Task.Delay(sendRate))
            {
                
            }
        }

        //MOET NOG IN EIGEN CLASS, MISSCHIEN FILE MANAGER OFWEL IN DE LIBRARY
        public byte[] ObjectToByteArray(WorldData worldData)
        {
            if (worldData == null) return null;
            BinaryFormatter bf = new BinaryFormatter();
            using (MemoryStream ms = new MemoryStream())
            {
                bf.Serialize(ms, worldData);
                return ms.ToArray();
            }
        }

        public void ClientEntersRoom(Client client)
        {
            Players.Add(new Player(client));

            NetOutgoingMessage outgoingMessage = LobbyManager.Server.CreateMessage();
            outgoingMessage.Write((byte)PacketTypes.EnterRoom);
            outgoingMessage.Write(Id);

            byte[] worldDataArray = ObjectToByteArray(WorldData);
            outgoingMessage.Write(worldDataArray.Length);
            outgoingMessage.Write(worldDataArray);
            LobbyManager.Server.SendMessage(outgoingMessage, client.Connection, NetDeliveryMethod.ReliableOrdered, 1);
            
            outgoingMessage = LobbyManager.Server.CreateMessage();
            outgoingMessage.Write((byte)PacketTypes.Message);
            outgoingMessage.Write("You (Client: " + Id + ") now got into a room, welcome to room number " + Id + ".");
            LobbyManager.Server.SendMessage(outgoingMessage, client.Connection, NetDeliveryMethod.ReliableOrdered, 0);

            ConsoleWrite("New player has joined the room: Client " + client.Id);
        }

        public void ConsoleWrite(string message)
        {
            //Add message to pool
            RoomConsole.Add(message);

            //Update message in given LogOutputBox
            LogOutputBox?.Dispatcher.BeginInvoke(new Action(() =>
            {
                LogOutputBox.AppendText(message + "\r\n");
            }));
        }

        public override string ToString()
        {
            return Name + " ID: " + Id + " PlayerCount: " + Players.Count;
        }
    }
}