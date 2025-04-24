rule regex
//should determine password_dump.txt and userconfig.txt
{
	meta:
		Date: "2025-04-24"
	strings: 
		$rootUser = "root"
		$theme = "theme"
		$timeout = "timeout"
	condition:
		$theme and $timeout and not $rootUser
}
