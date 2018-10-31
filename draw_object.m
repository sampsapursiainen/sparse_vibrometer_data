function [] = draw_object(g_data, m_data)
%[] = draw_object(g_data, m_data)
%Draws the 3D-model of object and the measurement points of vibration data
%Takes parameters structs g_data and m_data which are created by functions
%load_geometry and load_measurements
%
%
% Copyright © 2018 Noora Simonen, Sampsa Pursiainen
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

figure(1); clf; hold on;
h_surf = trisurf(g_data.triangles, g_data.x_0, g_data.y_0, g_data.z_0,'edgecolor','none');
set(h_surf, 'facealpha',0.7);
h = scatter3(m_data.x,m_data.y,m_data.z); 
scatter3(m_data.piezo(1),m_data.piezo(2),m_data.piezo(3),'r','*');
camlight right;
camlight left;
lighting phong;
material(0.5*[1 1 1]);


iso_surf = isosurface(g_data.x_ref,g_data.y_ref,g_data.z_ref,g_data.ref_array,g_data.stone_threshold);
hsurf = trisurf(iso_surf.faces,iso_surf.vertices(:,1),iso_surf.vertices(:,2),iso_surf.vertices(:,3));
set(hsurf,'facecolor',[0.25 0.25 1]);
set(hsurf,'facealpha',0.6);
set(hsurf,'edgecolor','none');
set(gca,'ygrid','on')
set(gca,'zgrid','on')
set(gca,'xgrid','on')
set(gca, 'xlim',[-80 80])
set(gca, 'ylim',[-80 80])
set(gca, 'zlim',[-80 80])
hold off;
axis equal

xlabel('x');
ylabel('y');
zlabel('z');


rotate(h,[2 2],90);
end