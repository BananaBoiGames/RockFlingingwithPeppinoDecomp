function options_init() //options_init
{
    global.options = 
    {
        audio: 
        {
            master: 1,
            sfx: 1,
            music: 1
        }
    }

    audio_master_gain(global.options.audio.master)
}

