## foreach

```powershell
$colors = @("red", "blue", "green")
foreach ($color in $colors) { echo $color }
foreach ($color in @("red", "blue", "green")) { echo $color }
foreach ($container in @(docker ps -q -f status=exited)) { echo $container }
foreach ($container in @(docker ps -q -f status=exited)) { docker rm $container }
docker rm @(docker ps -q -f status=exited)
docker ps -q -f status=exited | foreach {$_}
```

- https://powertoe.wordpress.com/2009/12/14/powershell-part-4-arrays-and-for-loops/
