% count=size(Z0)
% hold on;
% for i=1:count
%     z=Z0(i);
%     color=[z/40,0,z/40];
%     plot(X0(i),Y0(i),'.','MarkerSize',1, 'MarkerEdgeColor',color,'MarkerFaceColor',color);
% end
% 
% MZ=max(Z0)

% clf
% hold on;
MX=max(X0);
MZ=max(Z0);
% for z=MZ:-1:1
%     figure
%     color=[z/MZ,0,1-z/MZ];
%     plot(z,1,'.','MarkerSize',25, 'MarkerEdgeColor',color,'MarkerFaceColor',color,'EraseMode','xor');
% end

% N=39;
% figure
% hold on;
% for z=N:-1:1
%     color=[z/N,0,1-z/N];
%     index=find(Z0(:)==z);
%     plot(X0(index),Y0(index),'.','MarkerSize',2, 'MarkerEdgeColor',color,'MarkerFaceColor',color);
% end
% hold off;
%  
% N=4;
% figure
% for z=1:4
%     subplot(2,2,z)
%     color=[z/N,0,1-z/N];
%     index=find(Z0(:)==MZ-z+1);
%     plot(X0(index),Y0(index),'.','MarkerSize',1, 'MarkerEdgeColor',color,'MarkerFaceColor',color);
% end
% 
% N=4;
% figure
% for z=1:4
%     subplot(2,2,z)
%     color=[z/N,0,1-z/N];
%     index=find(Z0(:)==MZ-z-3);
%     plot(X0(index),Y0(index),'.','MarkerSize',1, 'MarkerEdgeColor',color,'MarkerFaceColor',color);
% end
% 
% N=16
% figure
% for z=1:N
%     subplot(4,4,z)
%     color=[z/N,0,1-z/N];
%     index=find(Z0(:)==MZ-z-7);
%     plot(X0(index),Y0(index),'.','MarkerSize',5, 'MarkerEdgeColor',color,'MarkerFaceColor',color);
% end
N=39
for z=N:-1:1
%     color=[z/N,0,1-z/N];
    index=find(Z0(:)==z);
    HeatMap(X0(index),Y0(index))
%     plot(X0(index),Y0(index),'.','MarkerSize',2, 'MarkerEdgeColor',color,'MarkerFaceColor',color);
end