# Robot-arm-Matlab-simulation & Tangram-recognition

Hi, there. I am Zhiyu Wang, this project is graduation design for my bachlor's degree in Automation. <br />
It is finished at May, 2017, which is about 2 years ago. However, recently, I realized I didn't collect the source code well. Then I decided to use some of my spare time to recollect and rewrite some of the Matlab source code, and also write a readable introduction to this interesting project. Hopefully everyone could get what they want from it.<br />
From the title, it could be told obviously that this project consists of 2 parts, robot arm simulation, and multi-colored tangram recognition. So 2 fields are covered here, robot arm control and simulation and also computer vision. Specially, I constructed a 6 axis robot arm module by using toolboxes released by Prof.Peter Corke. Besides that, the recognition part is accomplished with a traditional ROI extraction and analysis way. Basically, trangrams are recognized by their color information, also I am working on solve the problem with a ML way recently.<br />
Now let's officially start introducing.

## Getting Started

Best reference for this project is the book written by Prof.Peter Corke, <br /><Robotics, Vision and Control Fundamental algorithms in Matlab> https://www.amazon.com/Robotics-Vision-Control-Fundamental-Algorithms/dp/3642201431.<br />
Also all the information could also be found at Prof.Peter Corke's personal website. http://petercorke.com/wordpress/.

### Prerequisites

Installing the Toolboxes:<br />

```
Downloading robot toolbox, 10.3.1 most recent version, and vision toolbox, 4.3 most recent version.
The toolboxes are each packaged in a single zip format file.
And each is able to be unzipped as a "rvctools" folder. All toolboxes are freely available from:

                                https://www.petercorke.com/RVC

```

### Add toolboxes to your MATLAB path

After downloading both toolboxes, robot and vision, you can use any unarchiving tool to unpack the files that you downloaded.(If you downloaded zip files.)

To add toolbox to your MATLAB path, you can execute the following command to link directory to MATLAB path:
```
>> addpath RVCDIR;
```
where RVCDIR is the full pathname of the directory where you unpacked the top-level toolbox directory rvctools. For example, for me, it is "Users/zhiyuwang/Desktop/Robotics/rvctools" on Mac OS. This command works on both Linux and Windows(8+).

And execute

```
>> startup_rvc
```

If you open the rvctools folder you got from unzip compressed files, you could find a startup_rvc.m MATLAB file in it. This command is actually executing this file, and finishing all the set-ups and configurations for you.

## Authors

* **Zhiyu Wang**
