function [g_data] = load_geometry(object)
%[g_data] = load_geometry(object)
%Loads data for constructing 3D models of the surface of the object and 
%the stones inside it.
%Parameter 'object' can have values 1 and 2.
%
%Returns a struct which has the following components:
%x_ref, y_ref and z_ref are the coordinates related to CT scan
%ref_array holds the values for each point (x_ref, y_ref, z_ref). The
%values present the density of the material in each point.
%stone_threshold is used as a limit value to detect the stones from CT
%data.
%x_0, y_0 and z_0 are the coordinates of the surface of the object
%triangles contains the combinations of points (x_0, y_0, z_0). The surface
%is constructed of filled triangles placed by these combinations of points.
%
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
    source_folder = sprintf('%s%d/ct', base_folder, object);

    x_ref = zeros(150,150,150);
    y_ref = zeros(150,150,150);
    z_ref = zeros(150,150,150);
    ref_array = zeros(150,150,150);

    for i = 1 : 150
        a = load([source_folder '/x_ref_' int2str(i) '.dat']);
        b = load([source_folder '/y_ref_' int2str(i) '.dat']);
        c = load([source_folder '/z_ref_' int2str(i) '.dat']);
        d = load([source_folder '/reference_array_' int2str(i) '.dat']);
        x_ref(:,:,i) = a;
        y_ref(:,:,i) = b; 
        z_ref(:,:,i) = c; 
        ref_array(:,:,i) = d;
    end

    stone_threshold = load([source_folder '/stone_threshold.dat']);

    source_folder = sprintf('%s%d/3d_scan', base_folder, object);

    triangles = load([source_folder '/triangles.dat']);
    x_0 = load([source_folder '/x_0.dat']);
    y_0 = load([source_folder '/y_0.dat']);
    z_0 = load([source_folder '/z_0.dat']);
    
    g_data.x_ref = x_ref;
    g_data.y_ref = y_ref;
    g_data.z_ref = z_ref;
    g_data.ref_array = ref_array;
    g_data.stone_threshold = stone_threshold;
    g_data.x_0= x_0;
    g_data.y_0 = y_0;
    g_data.z_0 = z_0;
    g_data.triangles = triangles;
end