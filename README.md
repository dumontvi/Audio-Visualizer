# Audio-Visualizer
An audio-visualizer on an 8x8 LED Matrix done in Verilog.

Collaborator - Marian Daniel, Electrical Engineering, University of Toronto

![alt text](https://github.com/dumontvi/Audio-Visualizer/blob/master/Project_pictures/LED_Proj.jpg)
![alt text](https://github.com/dumontvi/Audio-Visualizer/blob/master/Project_pictures/LED_project.png)

# Introduction:
Music is something that everyone can appreciate. While listening to music is nice, it would be nice to “see” what the music really is. So, we decided to start thinking about a way to take some audio, somehow “interpret” the audio and represent it to the user visually, somehow. While using a VGA is very interesting, we wanted to venture into grounds farther than the scope of the Digital Systems course, and work our way into knowledge we gained from other circuitry courses and design courses.

So we decided to build a audio interpreter on the DE1-SOC board with an auxiliary LED display. We will also do some time-domain audio manipulations like altering speed. 

After doing a bit of research, we realized we can display an interpretation of the audio using two methods, either via a time domain analysis or a frequency domain analysis.  We decided that we will stick with the frequency domain analysis and learn the Fourier Series and how to implement a Fourier Transformation on the audio. 

# Design:
Design Consists (Largely) of : 

1) Audio core - Altera IP core for ADC/DAC conversion
![alt text](https://github.com/dumontvi/Audio-Visualizer/blob/master/Project_pictures/audio%20core.jpg)
Fig 1: Audio core block diagram

The Audio CODEC receives the input audio(32-bits) in an analogue form, which is later decoded using the ADC into a digital form. Before the audio is sent out, it can be manipulated and then sent to the DAC to convert it back into the analog form four output.

2) Vga core (testing purposes) - Altera IP for VGA output (adapted from the video recorder demo provided in the project handout)
![alt text](https://github.com/dumontvi/Audio-Visualizer/blob/master/Project_pictures/VGA%20block.jpg) Fig 2: VGA block diagram

The VGA core was only used for preliminary testing purposes in our project and was not the main focus of the project. The VGA core displayed the analog graph of the audio input, which helped gain a better understanding of analysing audio and reproducing it on the LED display. The x and y coordinates were plotted in the display module, which is later sent to the VGA to be plotted as a white pixel. The refresh rates of the display can be synchronized with the VGA core to prevent flickering using the V_Sync output from the monitor. 

3) Ram read /write controller (recordram module)
   
   Our project utilizes the SDRAM available on the DE-1 soc board to store the audio bits. The SDRAM is used to record and play our audio, which can be viewed in our recordram module. In record mode (~KEY[1]), when clocked, the audio is read into the addresses and each bit is stored in a different memory cell. If the user toggles play mode(~KEY[2]), during the next clock cycle, the ram module will pass the store bits to the Audio Codec output. The user can also reset(~KEY[0]) or pause(SW[0]) the input. This module uses a Finite State Machine(FSM) to toggle between these states. The controller will keep writing until memory is exhausted and then the controller will wrap and start overwriting data from the beginning. 

4) Display module (display_onVGA module)

Initially, most of our testing was done on the VGA module, which was adapted from the video recorder demo from the project handout. This module works very closely with the VGA adapter. It gets in the audio input and helped us obtain coordinates for the 320x240 screen, which helped us the plot the coordinates and color each pixel on the VGA. It also utilises the concept of Finite State Machines(FSMs) and a delay counter to obtain the y coordinate for each x coordinate.

5) LED Shrink and LED Lookup Table 

![alt text](https://github.com/dumontvi/Audio-Visualizer/blob/master/Project_pictures/LED%20Matrix%20circuit.jpg)
Fig 3: LED matrix circuit diagram                                  

![alt text](https://github.com/dumontvi/Audio-Visualizer/blob/master/Project_pictures/LED.jpg)						Fig 4: LED matrix

For this project, the LED matrix was constructed in house using a PCB design software called Eagle. The board was then etched using toner transfer method and then drilled, and then, LED’s were hand soldered onto the board.

The LED look-up-table is made very similar to the way the VGA core works. It takes an X location, Y location and turns on the LED at that particular location. The LED Shrink module is the mass of this project, as it takes data adapted to be used for a VGA and shrinks the resolution to that of the LED matrix and passes off the coordinate into the LED lookup table. 

i) LED Shrink module:

Since the data coming in was plotted on a larger scale than our LED matrix, we had to scale it down to a 8x8 display and obtain coordinate on a zero to eight scale. Hence, we had a LED shrink module,which helped us gain the value of each pixel on a zero to eight scale and sent into a LED look-up table.

ii) LED look-up table:

The value received has to be analysed and must be displayed on the LED matrix. Therefore, we made a sixty-four case lookup table, which helped us get control of each LED in our 8x8 LED matrix. The coordinates would be searched within this module and the respective GPIOs would be set as Vcc and ground in order to light up the LED. This was not the biggest struggle within this module. In fact, it was even harder to find the exact counter to help synchronize the LED display and to show it at a visible speed to the naked eye.

# Project Success:
We believe the project was successful as we had a perfect working model of our audio visualizer at the end of the three weeks. We achieved all our milestones each week and was overall happy with our project.
It recorded, playbacked and manipulated the audio i.e slows down or quicken the playback rate. We were also able to test our audio visualizer on different scales of audio sensitivity that is gain analysis. We were able to reproduce this effect on the LED matrix where the green LEDs represented low levels of amplitude and the yellow and red LEDs represented higher gain levels. 
ALthough we completed our project in time and everything worked as we planned, we were disappointed that we could not do our audio analysis in the frequency domain as it was out of scope of this course and had involved the use of the NIOS II microprocessor with the DE-1 soc board, which we were not familiar with.

# What we would have done differently:
Although we were satisfied with our project, we think our project could have better if we did the following changes:
Addition of an extra input source such as a touch pad or an instrument to generates beats.
If provided with more time, we would have implemented a 3D version of our product on a 8x8x8 RGB LED matrix, which would have been a better representation of the audio analysis
We would have also tried making an VGA output as an audio mixer, which would have given the user information such as recorded time and playback speed.
 External sensor to sense hand gestures to give audio commands such as play, record or pause.

# Appendix
1) Schematics:

Top-level module 
![alt text](https://github.com/dumontvi/Audio-Visualizer/blob/master/Project_pictures/top_level_module.png)

Ram read/write contorller(recordram module)
![alt text](https://github.com/dumontvi/Audio-Visualizer/blob/master/Project_pictures/RecordRAM.png)

Finite State Machine for recordram module
![alt text](https://github.com/dumontvi/Audio-Visualizer/blob/master/Project_pictures/FSM_LED.png)

Display Module
![alt text](https://github.com/dumontvi/Audio-Visualizer/blob/master/Project_pictures/Display%20Module.png)

LED matrix modules
![alt text](https://github.com/dumontvi/Audio-Visualizer/blob/master/Project_pictures/LED%20Matrix%20module.png)

