{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedLists #-}
{-# LANGUAGE OverloadedStrings #-}

module Simplex.Chat.Operators.Presets where

import Data.List.NonEmpty (NonEmpty)
import Simplex.Chat.Operators
import Simplex.Messaging.Agent.Env.SQLite (allRoles)
import Simplex.Messaging.Agent.Store.Entity
import Simplex.Messaging.Protocol (ProtocolType (..), SMPServer)

operatorSimpleXChat :: NewServerOperator
operatorSimpleXChat =
  ServerOperator
    { operatorId = DBNewEntity,
      operatorTag = Just OTSimplex,
      tradeName = "SimpleX Chat",
      legalName = Just "SimpleX Chat Ltd",
      serverDomains = ["simplex.im"],
      conditionsAcceptance = CARequired Nothing,
      enabled = True,
      smpRoles = allRoles,
      xftpRoles = allRoles
    }

allPresetServers :: NonEmpty SMPServer
allPresetServers =
  [ "smp://V8Q1-2gtYUqVxcJ0UiCXl-fvGgmp6cIJbPsMU4_QVaU=@smp1.orbitprojoint.pro:5223",
    "smp://lD5O5P-nQwMWy1P7XJjOmmzes67iLIvHGx4vkksmmfU=@smp2.orbitprojoint.pro:5224"
  ]

simplexChatSMPServers :: [NewUserServer 'PSMP]
simplexChatSMPServers =
  map
    (presetServer True)
    [ "smp://V8Q1-2gtYUqVxcJ0UiCXl-fvGgmp6cIJbPsMU4_QVaU=:q1BFzMg5TPta6e6frtm1G46ad7wls5SXdm8bc3pjBKg@smp1.orbitprojoint.pro:5223",
      "smp://lD5O5P-nQwMWy1P7XJjOmmzes67iLIvHGx4vkksmmfU=:q1BFzMg5TPta6e6frtm1G46ad7wls5SXdm8bc3pjBKg@smp2.orbitprojoint.pro:5224"
    ]

simplexChatXFTPServers :: [NewUserServer 'PXFTP]
simplexChatXFTPServers =
  map
    (presetServer True)
    [ "xftp://HBYUte_QuS3IdwP4XFUGd-M7WTewaRyuE7zpvjFeOFY=@xftp.orbitprojoint.pro:5443"
    ]
