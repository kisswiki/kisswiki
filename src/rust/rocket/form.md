## `rename_all = "camelCase"` doesn't work for Form

13:07	rofrol	I'm sending Form Data
13:07	rofrol	but serialization doesn't work
13:07	rofrol	#[serde(rename_all = "camelCase")] doesn't work
13:08	rofrol	for Form<...>
13:08	rofrol	but it works for JSON
13:10	SergioB	Forms don't go through serde
13:10	SergioB	You can rename fields on master, but not 0.2.
13:11	rofrol	thanks
13:11	Sergio	There's a closed issue on GitHub about this by the way. In case you want to read more. 
13:14	Sergio	https://github.com/SergioBenitez/Rocket/issues/217


you can create a custom FormForm implementation https://github.com/SergioBenitez/Rocket/issues/217#issuecomment-284110015
