rule modsync_trojan
{
	meta: 
		Date = "05-05-2025"
		Category = "Trojan"
		MD5 = "ddd5f9207c5d8c147aea77f8d9e77e22"
		SHA256 = "23076d1481440ca92d69bf92edd6cd8b4cc99749c3d50f3af0ab05c58a2efe7"

	strings:
		$unusualPath = "C:\Users\Student\Desktop\mobsync.exe"
		$procCond1 = "--type=gpu-process --gpu-preferences=UAAAAAAAAADgAAAEAAAAAAAAAAAAAAAAAABgAAAAAAAAAAAAAAAAAAAAAAACAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAEAAAAAAAAAAIAAAAAAAAAAgAAAAAAAAA --use-gl=angle --use-angle=swiftshader-webgl --field-trial-handle=1916,i,17123744840574654729,6482491809874228171,262144 --variations-seed-version --mojo-platform-channel-handle=1912 /prefetch:2"
		$procCond2 = "--type=utility --utility-sub-type=network.mojom.NetworkService --lang=en-US --service-sandbox-type=none --field-trial-handle=1916,i,17123744840574654729,6482491809874228171,262144 --variations-seed-version --mojo-platform-channel-handle=2188 /prefetch:3"

	condition:
		all of them
}
