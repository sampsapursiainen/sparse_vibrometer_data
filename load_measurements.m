function [m_data] = load_measurements(object, face, piezo)
%[m_data] = load_measurements(object, face, piezo)
%Loads acoustic vibration data related to certain measurement.
%
%Takes parameters object, face and piezo.
%There are 2 objects. Both of them have 6 faces. Piezo is the source of the
%acoustic signal. There were 6 measurements for object 1 and 7 for object 2.
%Measurements for object 1: (1,1,1),(1,2,2),(1,3,3),(1,4,4),(1,5,5),(1,6,6)
%Measurements for object 2: (2,1,1),(2,2,1),(2,2,2),(2,3,4),(2,4,3),(2,5,1),(2,6,1)
%
%Returns a struct which contains the measurement data. It has the following 
%components:
%x, y and z are the coordinates of measurement points.
%vib_x, vib_y and vib_z are the x, y and z components of measured vibrations 
%in each measurement point. t is the time vector.
%piezo contains the coordinates of the signal source.
%
% Copyright 2018 Noora Simonen
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy 
% of this software and associated documentation files (the "Software"), to deal 
% in the Software without restriction, including without limitation the rights 
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
% copies of the Software, and to permit persons to whom the Software is furnished 
% to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in 
% all copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
% WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR 
% IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

    base_folder = './travel_time_data/object_';

    if object == 1
        source_folder = sprintf('%s%d/vib/face_%d', base_folder, object, face);
    else
        source_folder = sprintf('%s%d/vib/face_%d_piezo_%d', base_folder, object, face, piezo);
    end

    x = load([source_folder '/x.dat']);
    y = load([source_folder '/y.dat']);
    z = load([source_folder '/z.dat']);
    vib_x = load([source_folder '/vib_x.dat']);
    vib_y = load([source_folder '/vib_y.dat']);
    vib_z = load([source_folder '/vib_z.dat']);
    t = load([source_folder '/t.dat']);
    piezo = load([source_folder '/piezo.dat']);
    
    m_data.x = x;
    m_data.y = y;
    m_data.z = z;
    m_data.vib_x = vib_x; 
    m_data.vib_y = vib_y;
    m_data.vib_z = vib_z;
    m_data.t = t;
    m_data.piezo = piezo;
end
