以下方法你都可以使用print()方法来打印看看结果。


返回版本信息
```lua
GetBuildInfo()
```

返回子区域的名字，其中包含了炉石所在地。
```lua
GetBindLocation()
```
获得当前地图地下城等级
GetCurrentMapDungeonLevel()

将地图设置为当前区域
SetMapToCurrentZone()

获得当前地图ID
GetCurrentMapAreaID()

获得当前地图的地标数量
可能是地下城和团本的数量
GetNumMapLandmarks()

获得地标信息
_, _, _, _, x, y, _, _, _, _, _, _, atlasIcon = GetMapLandmarkInfo(i)


通过ID设置地图
curMapID = GetCurrentMapAreaID()
SetMapByID(curMapID)

返回所处位置的ID
参考：https://wowpedia.fandom.com/wiki/API_GetRealmID
GetRealmID()

返回所处位置的名称
参考：https://wow.gamepedia.com/API_GetRealmName
GetRealmName()


返回角色当前所在子区域，如果当前没有子区域，会返回空串。
```lua
GetSubZoneText()
```


小地图按钮
```lua
LibStub()
```

返回当前游戏帧数
```lua
framerate()
```

添加到界面选项
```lua
InterfaceOptions_AddCategory(frame)
```

好像是外观收集
C_TransmogCollection.PlayerHasTransmog(itemId)

该商人能否修理
CanMerchantRepair


更改指定聊天框文本颜色
参考：https://wowpedia.fandom.com/wiki/API_ChangeChatColor

设置字体颜色
参考：https://wowpedia.fandom.com/wiki/API_FontString_SetTextColor
fontString:SetTextColor(red, green, blue [, alpha])



返回战网好友账号信息
参考：https://wowpedia.fandom.com/wiki/API_C_BattleNet.GetAccountInfoByID
accountInfo = C_BattleNet.GetAccountInfoByID(id [, wowAccountGUID])
            = C_BattleNet.GetAccountInfoByGUID(guid)
            = C_BattleNet.GetFriendAccountInfo(friendIndex [, wowAccountGUID])

检索好友列表中的某个人的信息
参考：https://wowpedia.fandom.com/wiki/API_C_FriendList.GetFriendInfo
info = C_FriendList.GetFriendInfo(name)
     = C_FriendList.GetFriendInfoByIndex(index)


获取战网好友数量
获取战网在线好友数量
获取战网亲密好友数量
获取战网亲密好友在线数量
参考：https://wowpedia.fandom.com/wiki/API_BNGetNumFriends
numBNetTotal, numBNetOnline, numBNetFavorite, numBNetFavoriteOnline = BNGetNumFriends()

获取魔兽好友数量
参考：
C_FriendList.GetNumFriends()

获取魔兽在线好友数量
C_FriendList.GetNumOnlineFriends();

返回当前选中的魔兽好友索引
参考：https://wowpedia.fandom.com/wiki/API_C_FriendList.GetSelectedFriend
selectedFriend = C_FriendList.GetSelectedFriend();

返回当前选中的战网好友索引
selectedFriend = BNGetSelectedFriend()

返回关于玩家的战网信息
参考：https://wowpedia.fandom.com/wiki/API_BNGetInfo
presenceID, battleTag, toonID, currentBroadcast, bnetAFK, bnetDND, isRIDEnabled = BNGetInfo()


战网收到的好友邀请数量
参考：https://wow.gamepedia.com/API_BNGetNumFriendInvites
BNGetNumFriendInvites()

获取战网好友信息
参考：https://wowpedia.fandom.com/wiki/API_BNGetFriendInviteInfo
inviteID, accountName, isBattleTag = BNGetFriendInviteInfo(i)

获取公会名册
参考：https://wowpedia.fandom.com/wiki/API_C_GuildInfo.GuildRoster
C_GuildInfo.GuildRoster()

播放声音
似乎只能用来播放暴雪的自带的声音，好处是有播放结束的标志位
参考：https://wowpedia.fandom.com/wiki/API_PlaySound
willPlay, soundHandle = PlaySound(soundKitID [, channel, forceNoDuplicates, runFinishCallback])


播放用户插件的声音文件
可以使用相对路径播放用户自己的声音文件，但好像没有标志位
参考：https://wowpedia.fandom.com/wiki/API_PlaySoundFile
willPlay, soundHandle = PlaySoundFile("soundFile" or soundFileID [, "channel"])



如果鼠标光标当前持有物品，则返回1
参考：https://wowpedia.fandom.com/wiki/API_CursorHasItem
hasItem = CursorHasItem()



获得场景信息
select(10, C_Scenario.GetInfo()) == LE_SCENARIO_TYPE_CHALLENGE_MODE and select(3, C_Scenario.GetInfo()) ~= 0
C_Scenario.GetInfo()


地下城的完成信息
参考：https://wowpedia.fandom.com/wiki/API_C_ChallengeMode.GetCompletionInfo
mapChallengeModeID, level, time, onTime, keystoneUpgradeLevels, practiceRun = C_ChallengeMode.GetCompletionInfo()

获得地图UI信息？
参考：https://wowpedia.fandom.com/wiki/API_C_ChallengeMode.GetMapUIInfo
name, id, timeLimit, texture, backgroundTexture = C_ChallengeMode.GetMapUIInfo(mapChallengeModeID)


获取史诗钥石的活动信息
参考：https://wowpedia.fandom.com/wiki/API_C_ChallengeMode.GetActiveKeystoneInfo
activeKeystoneLevel, activeAffixIDs, wasActiveKeystoneCharged = C_ChallengeMode.GetActiveKeystoneInfo()

获取当前活动的挑战地图的ID
challengeMapID = C_ChallengeMode.GetActiveChallengeMapID()

获取经过的时间
参考：https://wowpedia.fandom.com/wiki/API_GetWorldElapsedTimers
GetWorldElapsedTimers()

参考：https://wowpedia.fandom.com/wiki/API_GetWorldElapsedTime
tpye可能等于LE_WORLD_ELAPSED_TIMER_TYPE_CHALLENGE_MODE
unknown, elapsedTime, type = GetWorldElapsedTime(timerID)

