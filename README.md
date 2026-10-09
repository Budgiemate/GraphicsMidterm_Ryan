# GraphicsMidterm_Ryan

**floor Reflection Shader**

the floor reflection shader uses the world reflection shader in class however how this differs is that it also has a reflection tint to make the floor look more shiny my making the reflection tint bright white. This was done by multiplying the environment intensity by the refelction color property newly created by me.

**Basketball Spin Shader**

the basketball spin shader achieves the purpose of making the ball look like it is moving mid-air. This is done by adding a scrollspeed property and moving the texture by adding the scrollspeed multiplied by the current time elapsed making the texture smoothly rotate around the ball model. making a new property to create this effect is the best way to simplify the effect while needing to rewrite very little code.

**crowd cheer shader**

 the crowd cheer shader switches between the 2 textures i give it in the properties however since how it switches is when time.y is an even or odd number the switch is too fast to comprehend making this shader not work in the future I need to give it a cooldown between switches but I did not have time.

 ** every light shader**

 the shader that changes light styles would detect when the ball collides with something then changes the shader booleans to make it change values and light amounts.
