targetRoom = rm_testhub
targetDoor = "A"
ini_open("saveData.ini")
unlocked = ini_read_real("RockFling", "Complete", false)
ini_close()
if (0 || global.panic || (!unlocked))
    instance_destroy()
