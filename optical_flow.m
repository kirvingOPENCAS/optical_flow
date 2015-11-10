% 光流法测试--视频

clc

clear

close all

% 读取文件对象

% videoReader = vision.VideoFileReader('viptraffic.avi','ImageColorSpace','Intensity','VideoOutputDataType','uint8');

videoReader = vision.VideoFileReader('I:\ILSVRC2015\ILSVRC2015 _snippest_train_vali_test\Data\VID\snippets\val\ILSVRC2015_val_00027000.mp4','ImageColorSpace','Intensity','VideoOutputDataType','uint8');

% 类型转化对象

converter = vision.ImageDataTypeConverter;

% 光流对象

opticalFlow = vision.OpticalFlow('ReferenceFrameDelay', 1);

opticalFlow.OutputValue = 'Horizontal and vertical components in complex form';

if 0 % 使用的算法

opticalFlow.Method = 'Lucas-Kanade';

opticalFlow.NoiseReductionThreshold = 0.001; % 默认是0.0039

else

opticalFlow.Method = 'Horn-Schunck';

opticalFlow.Smoothness = 0.5; % 默认是1

end

% 显示对象

frame = step(videoReader);

figure

subplot(121)

himg = imshow(frame);

subplot(122)

hof = imshow(frame);

% 开始播放

while ~isDone(videoReader)

% 得到一帧

frame = step(videoReader);

% 格式转化

im = step(converter, frame);

% 计算光流

of = step(opticalFlow, im);

% 光流图转化

ofI = computeColor(real(of), imag(of));

% 显示

set(himg, 'cdata', frame)

set(hof, 'cdata', ofI)

drawnow

end

release(videoReader);

