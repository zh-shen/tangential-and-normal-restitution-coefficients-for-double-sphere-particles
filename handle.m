%注意：atan()只能输出[-pi/2,pi/2]的角度；asin()只能输出[-pi/2,pi/2]的角度；acos()只能输出[0,pi]的角度。
%Noting: atan() can only be used to output angle between [-pi/2,pi/2]; asin() can only be used to output angle between [-pi/2,pi/2]; acos() can only be used to output angle between [0,pi]

%for 
% collision between two single-spheres
[d1,d2,x1,y1,d5]=textread('2_2_po1.txt','%n%f%n%n%s','headerlines',2,'delimiter', ',');
[f1,f2,x2,y2,f5]=textread('2_2_po2.txt','%n%f%n%n%s','headerlines',2,'delimiter', ',');
if length(x1)~=length(x2);
	error('error. time demensions among the three files are not same')
end
s2(1)=0;
for i=1:55;
	s2(i+1)=s2(i)+((x2(i+1)-x2(i))^2+(y2(i+1)-y2(i))^2)^0.5;
end
v(1)=0;
for i=1:55;
	v(i+1)=s2(i+1)-s2(i);
end
for i=3:55;
	if (v(i+1)>3*v(i))&&(v(i+1)-v(i)>=4);
		co=i;
		break;
	end
end
v0=sqrt((x1(co)-x1(1))^2+(y1(co)-y1(1))^2)/(co-1)
sita0=atan((x1(co-1)-x1(1))/(y1(co-1)-y1(1)));
v1=sqrt((x1(co+4)-x1(co+1))^2+(y1(co+4)-y1(co+1))^2)/3
sita1=atan((x1(co+4)-x1(co+1))/(y1(co+4)-y1(co+1)));
%v1=sqrt((x1(co+1)-x1(co))^2+(y1(co+1)-y1(co))^2);
%v1=sqrt((x1(co+2)-x1(co+1))^2+(y1(co+2)-y1(co+1))^2);
%v1=sqrt((x1(co+4)-x1(co))^2+(y1(co+4)-y1(co))^2)/4;
v2=sqrt((x2(co+9)-x2(co+1))^2+(y2(co+9)-y2(co+1))^2)/8
sita2=atan((x2(co+9)-x2(co+1))/(y2(co+9)-y2(co+1)));
v0n=v0*cos(sita2-sita0)
v1n=v1*cos(sita2-sita1)
sita0=sita0*180/pi
sita1=sita1*180/pi
sita2=sita2*180/pi
sita2-sita0
sita2-sita1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%for 第二次实验 有角度的碰撞
% collision between two single-spheres
fid=fopen('C:\Users\zs\Documents\results.txt','a')  % open a file to write the results
for j=1:5;	%the j cycle can handle data from different experiment condition in succession.
	filename1=['h0s1-',num2str(j),'po1.txt'];
	filename2=['h0s1-',num2str(j),'po2.txt'];
	[d1,d2,x1,y1,d5]=textread(filename1,'%n%f%n%n%s','headerlines',2,'delimiter', ',');
	[f1,f2,x2,y2,f5]=textread(filename2,'%n%f%n%n%s','headerlines',2,'delimiter', ',');
	if length(x1)~=length(x2);
		error('error. time demensions among the three files are not same')
	end
	s2(1)=0;
	for i=1:30;
	%	s2(i+1)=s2(i)+((x2(i+1)-x2(i))^2+(y2(i+1)-y2(i))^2)^0.5;
		s2(i+1)=s2(i)+((y2(i+1)-y2(i))^2)^0.5;
	end
	v(1)=0;
	for i=1:30;
		v(i+1)=s2(i+1)-s2(i);
	end
	for i=3:30;
		if (v(i+1)>3*v(i))&&(v(i+1)-v(i)>3);
			co=i;
			break;
		end
	end
	v0=sqrt((x1(co)-x1(1))^2+(y1(co)-y1(1))^2)/(co-1)
	%v0=sqrt((x1(co-1)-x1(1))^2+(y1(co-1)-y1(1))^2)/(co-2)
	sita0=atan((y1(co-1)-y1(1))/(x1(co-1)-x1(1)));
	v1=sqrt((x1(co+8)-x1(co+1))^2+(y1(co+8)-y1(co+1))^2)/7	
	sita1=atan((y1(co+8)-y1(co+1))/(x1(co+8)-x1(co+1)));
	%v2=sqrt((x2(end)-x2(co+3))^2+(y2(end)-y2(co+3))^2)/(length(x2)-co-3)
	v2=sqrt((x2(end-1)-x2(co+2))^2+(y2(end-1)-y2(co+2))^2)/(length(x2)-co-3)
	sita2=atan((y2(end)-y2(co+3))/(x2(end)-x2(co+3)));
	v0n=v0*cos(sita2-sita0)
	v1n=v1*cos(sita2-sita1)
	sita0=sita0*180/pi
	sita1=sita1*180/pi
	sita2=sita2*180/pi
	sita2-sita0
	sita2-sita1
	fprintf(fid,'%s','h0s1-',num2str(j))
	fprintf(fid,' v0=%6.2f v1=%6.2f v2=%6.2f v0n=%6.2f v1n=%6.2f v2=%6.2f sita0=%6.2f sita1=%6.2f sita2=%6.2f sita2-sita0=%6.2f sita2-sita1=%6.2f ',v0,v1,v2,v0n,v1n,v2,sita0,sita1,sita2,sita2-sita0,sita2-sita1)	%output information about the experiment every lines.
	fprintf(fid,'\r\n')
end
fclose(fid)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%大批计算h几s几碰撞的
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% post-processing for a series of experiments data with name of h*s*
% collision between two single-spheres
fid=fopen('C:\Users\zs\Documents\results.txt','a')  % open a file to write the results
for k=0:4;
	for j=1:5;	%the j cycle can handle data from different experiment condition in succession.
		filename1=['h',num2str(k),'s1-',num2str(j),'po1.txt'];
		filename2=['h',num2str(k),'s1-',num2str(j),'po2.txt'];
		[d1,d2,x1,y1,d5]=textread(filename1,'%n%f%n%n%s','headerlines',2,'delimiter', ',');
		[f1,f2,x2,y2,f5]=textread(filename2,'%n%f%n%n%s','headerlines',2,'delimiter', ',');
		if length(x1)~=length(x2);
			error('error. time demensions among the three files are not same')
		end
		s2(1)=0;
		for i=1:30;
		%	s2(i+1)=s2(i)+((x2(i+1)-x2(i))^2+(y2(i+1)-y2(i))^2)^0.5;
			s2(i+1)=s2(i)+((y2(i+1)-y2(i))^2)^0.5;
		end
		v(1)=0;
		for i=1:30;
			v(i+1)=s2(i+1)-s2(i);
		end
		for i=3:30;
			if (v(i+1)>3*v(i))&&(v(i+1)-v(i)>3);
				co=i;
				break;
			end
		end
		v0=sqrt((x1(co)-x1(1))^2+(y1(co)-y1(1))^2)/(co-1)
		%v0=sqrt((x1(co-1)-x1(1))^2+(y1(co-1)-y1(1))^2)/(co-2)
		sita0=atan((x1(co-1)-x1(1))/(y1(co-1)-y1(1)));
		v1=sqrt((x1(co+8)-x1(co+1))^2+(y1(co+8)-y1(co+1))^2)/7	
		sita1=atan((x1(co+8)-x1(co+1))/(y1(co+8)-y1(co+1)));
		%v2=sqrt((x2(end)-x2(co+3))^2+(y2(end)-y2(co+3))^2)/(length(x2)-co-3)
		v2=sqrt((x2(end-1)-x2(co+2))^2+(y2(end-1)-y2(co+2))^2)/(length(x2)-co-3)
		sita2=atan((x2(end)-x2(co+3))/(y2(end)-y2(co+3)));
		v0n=v0*cos(sita2-sita0)
		v1n=v1*cos(sita2-sita1)
		sita0=sita0*180/pi
		sita1=sita1*180/pi
		sita2=sita2*180/pi
		sita2-sita0
		sita2-sita1
		fprintf(fid,'%s','h',num2str(k),'s1-',num2str(j))
		fprintf(fid,' v0=%6.2f v1=%6.2f v2=%6.2f v0n=%6.2f v1n=%6.2f v2=%6.2f sita0=%6.2f sita1=%6.2f sita2=%6.2f sita2-sita0=%6.2f sita2-sita1=%6.2f ',v0,v1,v2,v0n,v1n,v2,sita0,sita1,sita2,sita2-sita0,sita2-sita1)	%output information about the experiment every lines.
		fprintf(fid,'\r\n')
	end
end
fclose(fid)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%大批计算h几s几碰撞的 最终版
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% post-processing for a series of experiments data with name of h*s*. Final version
% collision between two single-spheres
fid=fopen('C:\Users\zs\Documents\text.txt','a')  % open a file to write the results
for k=0:4;
	for j=1:5;	%the j cycle can handle data from different experiment condition in succession.
		filename1=['h',num2str(k),'s1-',num2str(j),'po1.txt'];
		filename2=['h',num2str(k),'s1-',num2str(j),'po2.txt'];
		[d1,d2,x1,y1,d5]=textread(filename1,'%n%f%n%n%s','headerlines',2,'delimiter', ',');
		[f1,f2,x2,y2,f5]=textread(filename2,'%n%f%n%n%s','headerlines',2,'delimiter', ',');
		if length(x1)~=length(x2);
			error('error. time demensions among the three files are not same')
		end
		s2(1)=0;
		for i=1:30;
			s2(i+1)=s2(i)+((y2(i+1)-y2(i))^2)^0.5;
		end
		v(1)=0;
		for i=1:30;
			v(i+1)=s2(i+1)-s2(i);
		end
		for i=3:30;
			if (v(i+1)>3*v(i))&&(v(i+1)-v(i)>2.5);
				co=i;
				break;
			end
		end

		v0=sqrt((x1(co)-x1(1))^2+(y1(co)-y1(1))^2)/(co-1)
		v1=sqrt((x1(co+8)-x1(co+1))^2+(y1(co+8)-y1(co+1))^2)/7	
		v2=sqrt((x2(end-1)-x2(co+2))^2+(y2(end-1)-y2(co+2))^2)/(length(x2)-co-3)

		vec_12=0.5*[x2(co)+x2(co+1)-x1(co)-x1(co+1),y2(co)+y2(co+1)-y1(co)-y1(co+1),0];
		vec_v0=[x1(co)-x1(1),y1(co)-y1(1),0];
		vec_v1=[x1(co+8)-x1(co+1),y1(co+8)-y1(co+1),0];
		vec_v2=[x2(end-1)-x2(co+2),y2(end-1)-y2(co+2),0];

		alpha=acos(vec_12*vec_v0'/(norm(vec_12)*norm(vec_v0)));
		beta=acos(vec_12*vec_v2'/(norm(vec_12)*norm(vec_v2)));
		gamma=acos(vec_12*vec_v1'/(norm(vec_12)*norm(vec_v1)));

		v0n=v0*cos(alpha);
		v1n=v1*cos(gamma);
		v2n=v2*cos(beta);
		v0t=v0*sin(alpha);
		v1t=v1*sin(gamma);
		v2t=v2*sin(beta);

		temp1=cross(vec_12,vec_v0);
		temp2=cross(-vec_12,vec_v1);
		if sign(temp1(3))== sign(temp2(3))
			v1t=-v1t;
			gamma=-gamma;
		end
		temp1=cross(vec_12,vec_v0);
		temp2=cross(vec_12,vec_v2);
		if sign(temp1(3))~= sign(temp2(3))
			beta=-beta;
			v2t=-v2t;
		end

		alpha=alpha*180/pi
		beta=beta*180/pi
		gamma=gamma*180/pi
		fprintf(fid,'%s','h',num2str(k),'s1-',num2str(j))
		fprintf(fid,' v0=%6.2f v1=%6.2f v2=%6.2f v0n=%6.2f v1n=%6.2f v2n=%6.2f v0t=%6.2f v1t=%6.2f v2t=%6.2f alpha=%6.2f beta=%6.2f gamma=%6.2f ',v0,v1,v2,v0n,v1n,v2n,v0t,v1t,v2t,alpha,beta,gamma)	%output information about the experiment every lines.
		fprintf(fid,'\r\n')
	end
end
fclose(fid)


v0n=[];
v1n=[];
v2n=[];
v0t=[];
v1t=[];
v2t=[];

p=polyfit(v0n,v1n,1);
v0=5:0.1:12;
vt=polyval(p,v0);
plot(v0n,v1n,'o',v0,vt,'-*')

en=(v2n-v1n)/v0n;
et=(v2t-v1t)/v0t;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%计算一个h几d几的 最终版
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% post-processing for experiments data in a file. Final version
% a single-sphere hits on a double-sphere
[d1,d2,x1,y1,d5]=textread('h1d1-1po1.txt','%n%f%n%n%s','headerlines',2,'delimiter', ',');
[f1,f2,x21,y21,f5]=textread('h1d1-1po21.txt','%n%f%n%n%s','headerlines',2,'delimiter', ',');
[f1,f2,x22,y22,f5]=textread('h1d1-1po22.txt','%n%f%n%n%s','headerlines',2,'delimiter', ',');
if (length(x1)~=length(x21))||(length(x21)~=length(x22));
	error('error. time demensions among the three files are not same')
end
s21(1)=0;
for i=1:30;
	s21(i+1)=s21(i)+((x21(i+1)-x21(i))^2+(y21(i+1)-y21(i))^2)^0.5;
end
v(1)=0;
for i=1:30;
	v(i+1)=s21(i+1)-s21(i);
end
for i=3:30;
	if (v(i+1)>2.5*v(i))&&(v(i+1)-v(i)>1.5);
		co=i;
		break;
	end
end
v0=sqrt((x1(co)-x1(1))^2+(y1(co)-y1(1))^2)/(co-1)
v1=sqrt((x1(co+8)-x1(co+1))^2+(y1(co+8)-y1(co+1))^2)/7
x2M=(x21+x22)/2;y2M=(y21+y22)/2;
vM=sqrt((x2M(end-1)-x2M(co+1))^2+(y2M(end-1)-y2M(co+1))^2)/(length(x2M)-co-2)
vec_co=[x21(co+1)-x22(co+1),y21(co+1)-y22(co+1)]; vec_end=[x21(end-1)-x22(end-1),y21(end-1)-y22(end-1)];
fai=acos(vec_co*vec_end'/(norm(vec_co)*norm(vec_end))); w=fai/(length(x2M)-co-2) %fai is rotating angle of sphere pair ;right

vec_1U=0.5*[x21(co)+x21(co+1)-x1(co)-x1(co+1),y21(co)+y21(co+1)-y1(co)-y1(co+1),0];
vec_UD=[x22(co)-x21(co),y22(co)-y21(co),0];
vec_v0=[x1(co-1)-x1(1),y1(co-1)-y1(1),0];
vec_v1=[x1(co+8)-x1(co+1),y1(co+8)-y1(co+1),0];
vec_vM=[x2M(end-1)-x2M(co+1),y2M(end-1)-y2M(co+1),0];

alpha=acos(vec_1U*vec_v0'/(norm(vec_1U)*norm(vec_v0)));
beta=acos(vec_1U*vec_vM'/(norm(vec_1U)*norm(vec_vM)));
gamma=acos(vec_1U*vec_v1'/(norm(vec_1U)*norm(vec_v1)));
sita=acos(vec_1U*vec_UD'/(norm(vec_1U)*norm(vec_UD))); %计算sita1UD; right

v0n=v0*cos(alpha);v1n=v1*cos(gamma);vMn=vM*cos(beta);
v0t=v0*sin(alpha);v1t=v1*sin(gamma);vMt=vM*sin(beta);
vcn=w*49.5*sin(sita);

temp1=cross(vec_1U,vec_v0);
temp2=cross(-vec_1U,vec_v1);
if sign(temp1(3))== sign(temp2(3))
	v1t=-v1t;
	gamma=-gamma;
end
temp1=cross(vec_1U,vec_v0);
temp2=cross(vec_1U,vec_vM);
if sign(temp1(3))~= sign(temp2(3))
	vMt=-vMt;
	beta=-beta;
end

alpha=alpha*180/pi
beta=beta*180/pi
gamma=gamma*180/pi
sita=sita*180/pi
fai=fai*180/pi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%大批处理h几d几的,最终版
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% post-processing for experiments data in a series of files. Final version
% a single-sphere hits on a double-sphere
fid=fopen('C:\Users\zs\Documents\text.txt','a');  % open a file to write the results
for k=1:4;
	jm=20;
	if k==1;
		jm=55;
	end
	for j=1:jm;	%the j cycle can handle data from different experiment condition in succession.
		filename1=['h',num2str(k),'d1-',num2str(j),'po1.txt'];
		filename21=['h',num2str(k),'d1-',num2str(j),'po21.txt'];
		filename22=['h',num2str(k),'d1-',num2str(j),'po22.txt'];
		[d1,d2,x1,y1,d5]=textread(filename1,'%n%f%n%n%s','headerlines',2,'delimiter', ',');
		[f1,f2,x21,y21,f5]=textread(filename21,'%n%f%n%n%s','headerlines',2,'delimiter', ',');
		[f1,f2,x22,y22,f5]=textread(filename22,'%n%f%n%n%s','headerlines',2,'delimiter', ',');
		if (length(x1)~=length(x21))||(length(x21)~=length(x22));
			error('error. time demensions among the three files are not same')
		end
		s21(1)=0;
		for i=1:30;
			s21(i+1)=s21(i)+((x21(i+1)-x21(i))^2+(y21(i+1)-y21(i))^2)^0.5;
		end
		v(1)=0;
		for i=1:30;
			v(i+1)=s21(i+1)-s21(i);
		end
		for i=3:30;
			if (v(i+1)>2.5*v(i))&&(v(i+1)-v(i)>1.5);
				co=i;
				break;
			end
		end
		v0=sqrt((x1(co)-x1(1))^2+(y1(co)-y1(1))^2)/(co-1)
		v1=sqrt((x1(co+8)-x1(co+1))^2+(y1(co+8)-y1(co+1))^2)/7
		x2M=(x21+x22)/2;y2M=(y21+y22)/2;
		vM=sqrt((x2M(end-1)-x2M(co+1))^2+(y2M(end-1)-y2M(co+1))^2)/(length(x2M)-co-2)
		vec_co=[x21(co+1)-x22(co+1),y21(co+1)-y22(co+1)]; vec_end=[x21(end-1)-x22(end-1),y21(end-1)-y22(end-1)];
		fai=acos(vec_co*vec_end'/(norm(vec_co)*norm(vec_end))); w=fai/(length(x2M)-co-2) %fai is rotating angle of sphere pair ;right

		vec_1U=0.5*[x21(co)+x21(co+1)-x1(co)-x1(co+1),y21(co)+y21(co+1)-y1(co)-y1(co+1),0];
		vec_UD=[x22(co-1)-x21(co-1),y22(co-1)-y21(co-1),0];
		vec_v0=[x1(co-1)-x1(1),y1(co-1)-y1(1),0];
		vec_v1=[x1(co+8)-x1(co+1),y1(co+8)-y1(co+1),0];
		vec_vM=[x2M(end-1)-x2M(co+1),y2M(end-1)-y2M(co+1),0];

		alpha=acos(vec_1U*vec_v0'/(norm(vec_1U)*norm(vec_v0)));
		beta=acos(vec_1U*vec_vM'/(norm(vec_1U)*norm(vec_vM)));
		gamma=acos(vec_1U*vec_v1'/(norm(vec_1U)*norm(vec_v1)));
		sita=acos(vec_1U*vec_UD'/(norm(vec_1U)*norm(vec_UD))); %计算sita1UD; right

		v0n=v0*cos(alpha);v1n=v1*cos(gamma);vMn=vM*cos(beta);
		v0t=v0*sin(alpha);v1t=v1*sin(gamma);vMt=vM*sin(beta);
		vcn=w*49.5*sin(sita);
		vct=w*49.5*(cos(sita)+1)

		temp1=cross(vec_1U,vec_v0);
		temp2=cross(-vec_1U,vec_v1);
		if sign(temp1(3))== sign(temp2(3))
			v1t=-v1t;
			gamma=-gamma;
		end
		temp1=cross(vec_1U,vec_v0);
		temp2=cross(vec_1U,vec_vM);
		if sign(temp1(3))~= sign(temp2(3))
			vMt=-vMt;
			beta=-beta;
		end

		alpha=alpha*180/pi
		beta=beta*180/pi
		gamma=gamma*180/pi
		sita=sita*180/pi
		fai=fai*180/pi

		fprintf(fid,'%2s','h',num2str(k),'d1-',num2str(j))
		fprintf(fid,' v0=%6.2f v1=%6.2f vM=%6.2f w=%6.4f beta=%6.2f v0n=%6.2f v1n=%6.2f vMn=%6.2f v0t=%6.2f v1t=%6.2f vMt=%6.2f vcn=%6.2f vct=%6.2f vcn+vMn=%6.2f ',v0,v1,vM,w,beta,v0n,v1n,vMn,v0t,v1t,vMt,vcn,vct,vcn+vMn)	%output information about the experiment every lines.
		fprintf(fid,'\r\n')
	end
end
fclose(fid)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%调查在h几d几球对质心方向连线投影的关系,不考虑双球几何
% investigate is there any relationships if we defining the normal direction of the velocity as the direction connecting the hitting point and the center of the double-sphere
fid=fopen('C:\Users\zs\Documents\text.txt','a');  % open a file to write the results
for k=1:4;
	jm=20;
	if k==1;
		jm=55;
	end
	for j=1:jm;	%the j cycle can handle data from different experiment condition in succession.
		filename1=['h',num2str(k),'d1-',num2str(j),'po1.txt'];
		filename21=['h',num2str(k),'d1-',num2str(j),'po21.txt'];
		filename22=['h',num2str(k),'d1-',num2str(j),'po22.txt'];
		[d1,d2,x1,y1,d5]=textread(filename1,'%n%f%n%n%s','headerlines',2,'delimiter', ',');
		[f1,f2,x21,y21,f5]=textread(filename21,'%n%f%n%n%s','headerlines',2,'delimiter', ',');
		[f1,f2,x22,y22,f5]=textread(filename22,'%n%f%n%n%s','headerlines',2,'delimiter', ',');
		if (length(x1)~=length(x21))||(length(x21)~=length(x22));
			error('error. time demensions among the three files are not same')
		end
		s21(1)=0;
		for i=1:30;
			s21(i+1)=s21(i)+((x21(i+1)-x21(i))^2+(y21(i+1)-y21(i))^2)^0.5;
		end
		v(1)=0;
		for i=1:30;
			v(i+1)=s21(i+1)-s21(i);
		end
		for i=3:30;
			if (v(i+1)>2.5*v(i))&&(v(i+1)-v(i)>1.5);
				co=i;
				break;
			end
		end
		v0=sqrt((x1(co)-x1(1))^2+(y1(co)-y1(1))^2)/(co-1)
		v1=sqrt((x1(co+8)-x1(co+1))^2+(y1(co+8)-y1(co+1))^2)/7
		x2M=(x21+x22)/2;y2M=(y21+y22)/2;
		vM=sqrt((x2M(end-1)-x2M(co+1))^2+(y2M(end-1)-y2M(co+1))^2)/(length(x2M)-co-2)
		vec_co=[x21(co+1)-x22(co+1),y21(co+1)-y22(co+1)]; vec_end=[x21(end-1)-x22(end-1),y21(end-1)-y22(end-1)];
		fai=acos(vec_co*vec_end'/(norm(vec_co)*norm(vec_end))); w=fai/(length(x2M)-co-2) %fai is rotating angle of sphere pair ;right

		vec_1M=[x2M(co)+x2M(co+1)-x1(co)-x1(co+1),y2M(co)+y2M(co+1)-y1(co)-y1(co+1),0]; %%%
		vec_v0=[x1(co-1)-x1(1),y1(co-1)-y1(1),0];
		vec_v1=[x1(co+8)-x1(co+1),y1(co+8)-y1(co+1),0];
		vec_vM=[x2M(end-1)-x2M(co+1),y2M(end-1)-y2M(co+1),0];

		alpha=acos(vec_1M*vec_v0'/(norm(vec_1M)*norm(vec_v0)));
		beta=acos(vec_1M*vec_vM'/(norm(vec_1M)*norm(vec_vM)));
		gamma=acos(vec_1M*vec_v1'/(norm(vec_1M)*norm(vec_v1)));

		v0n=v0*cos(alpha) 
		v1n=v1*cos(gamma) 
		vMn=vM*cos(beta)
		v0t=v0*sin(alpha) 
		v1t=v1*sin(gamma) 
		vMt=vM*sin(beta)

		temp1=cross(vec_1M,vec_v0);
		temp2=cross(-vec_1M,vec_v1);
		if sign(temp1(3))== sign(temp2(3))
			v1t=-v1t;
			gamma=-gamma;
		end
		temp1=cross(vec_1M,vec_v0);
		temp2=cross(vec_1M,vec_vM);
		if sign(temp1(3))~= sign(temp2(3))
			vMt=-vMt;
			beta=-beta;
		end

		alpha=alpha*180/pi
		beta=beta*180/pi
		gamma=gamma*180/pi
		fai=fai*180/pi
		fprintf(fid,'%2s','h',num2str(k),'d1-',num2str(j))
		fprintf(fid,'  beta=%6.2f v0n=%6.2f v1n=%6.2f vMn=%6.2f v0t=%6.2f v1t=%6.2f vMt=%6.2f',beta,v0n,v1n,vMn,v0t,v1t,vMt)	%output information about the experiment every lines.在输出几个重要的角度
		fprintf(fid,'\r\n')
	end
end
fclose(fid)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%调查在h几d几球对质心方向连线投影的关系,考虑双球几何
fid=fopen('C:\Users\zs\Documents\text.txt','a');  % open a file to write the results
for k=1:4;
	jm=20;
	if k==1;
		jm=55;
	end
	for j=1:jm;	%the j cycle can handle data from different experiment condition in succession.
		filename1=['h',num2str(k),'d1-',num2str(j),'po1.txt'];
		filename21=['h',num2str(k),'d1-',num2str(j),'po21.txt'];
		filename22=['h',num2str(k),'d1-',num2str(j),'po22.txt'];
		[d1,d2,x1,y1,d5]=textread(filename1,'%n%f%n%n%s','headerlines',2,'delimiter', ',');
		[f1,f2,x21,y21,f5]=textread(filename21,'%n%f%n%n%s','headerlines',2,'delimiter', ',');
		[f1,f2,x22,y22,f5]=textread(filename22,'%n%f%n%n%s','headerlines',2,'delimiter', ',');
		if (length(x1)~=length(x21))||(length(x21)~=length(x22));
			error('error. time demensions among the three files are not same')
		end
		s21(1)=0;
		for i=1:30;
			s21(i+1)=s21(i)+((x21(i+1)-x21(i))^2+(y21(i+1)-y21(i))^2)^0.5;
		end
		v(1)=0;
		for i=1:30;
			v(i+1)=s21(i+1)-s21(i);
		end
		for i=3:30;
			if (v(i+1)>2.5*v(i))&&(v(i+1)-v(i)>1.5);
				co=i;
				break;
			end
		end
		v0=sqrt((x1(co)-x1(1))^2+(y1(co)-y1(1))^2)/(co-1)
		v1=sqrt((x1(co+8)-x1(co+1))^2+(y1(co+8)-y1(co+1))^2)/7
		x2M=(x21+x22)/2;y2M=(y21+y22)/2;
		vM=sqrt((x2M(end-1)-x2M(co+1))^2+(y2M(end-1)-y2M(co+1))^2)/(length(x2M)-co-2)
		vec_co=[x21(co+1)-x22(co+1),y21(co+1)-y22(co+1)]; vec_end=[x21(end-1)-x22(end-1),y21(end-1)-y22(end-1)];
		fai=acos(vec_co*vec_end'/(norm(vec_co)*norm(vec_end))); w=fai/(length(x2M)-co-2) %fai is rotating angle of sphere pair ;right


		vec_1M=[x2M(co)+x2M(co+1)-x1(co)-x1(co+1),y2M(co)+y2M(co+1)-y1(co)-y1(co+1),0]; %%%
		vec_1U=0.5*[x21(co)+x21(co+1)-x1(co)-x1(co+1),y21(co)+y21(co+1)-y1(co)-y1(co+1),0];
		vec_cM=[x2M(co-1),y2M(co-1),0]-[(x1(co)+x1(co+1)+x21(co)+x21(co+1))/4,(y1(co)+y1(co+1)+y21(co)+y21(co+1))/4,0];
		vec_UD=[x22(co-1)-x21(co-1),y22(co-1)-y21(co-1),0];
		vec_v0=[x1(co-1)-x1(1),y1(co-1)-y1(1),0];
		vec_v1=[x1(co+8)-x1(co+1),y1(co+8)-y1(co+1),0];
		vec_vM=[x2M(end-1)-x2M(co+1),y2M(end-1)-y2M(co+1),0];

		alpha=acos(vec_1M*vec_v0'/(norm(vec_1M)*norm(vec_v0)));
		beta=acos(vec_1M*vec_vM'/(norm(vec_1M)*norm(vec_vM)));
		gamma=acos(vec_1M*vec_v1'/(norm(vec_1M)*norm(vec_v1)));
		sita=acos(vec_1U*vec_UD'/(norm(vec_1U)*norm(vec_UD)));
		fai=acos(vec_1M*vec_cM'/(norm(vec_1M)*norm(vec_cM)));
		vc=w*49.5*2*cos(sita/2);

		v0n=v0*cos(alpha); v1n=v1*cos(gamma); vMn=vM*cos(beta); vcn=vc*cos(pi/2-fai);
		v0t=v0*sin(alpha); v1t=v1*sin(gamma); vMt=vM*sin(beta); vct=vc*sin(pi/2-fai);

		temp1=cross(vec_1M,vec_v0);
		temp2=cross(-vec_1M,vec_v1);
		if sign(temp1(3))== sign(temp2(3))
			v1t=-v1t;
			gamma=-gamma;
		end
		temp1=cross(vec_1M,vec_v0);
		temp2=cross(vec_1M,vec_vM);
		if sign(temp1(3))~= sign(temp2(3))
			vMt=-vMt;
			beta=-beta;
		end
		temp1=cross(vec_1M,vec_v0);
		temp2=cross(vec_1M,vec_cM);
		if sign(temp1(3))~= sign(temp2(3))
			vct=-vct;
		else
			fai=-fai;
		end

		alpha=alpha*180/pi
		beta=beta*180/pi
		gamma=gamma*180/pi
		sita=sita*180/pi
		fai=fai*180/pi

		fprintf(fid,'%2s','h',num2str(k),'d1-',num2str(j))
		fprintf(fid,'  beta=%6.2f fai=%6.2f v0n=%6.2f v1n=%6.2f vMn=%6.2f vcn=%6.2f v0t=%6.2f v1t=%6.2f vMt=%6.2f vct=%6.2f ',beta,fai,v0n,v1n,vMn,vcn,v0t,v1t,vMt,vct)	%output information about the experiment every lines.在输出几个重要的角度
		fprintf(fid,'\r\n')
	end
end
fclose(fid)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%调查在h几d几球对质心方向连线投影的关系,及角度方面的某些尝试
fid=fopen('C:\Users\zs\Documents\text.txt','a');  % open a file to write the results
for j=1:55;	%the j cycle can handle data from different experiment condition in succession.
	filename1=['h1d1-',num2str(j),'po1.txt'];
	filename21=['h1d1-',num2str(j),'po21.txt'];
	filename22=['h1d1-',num2str(j),'po22.txt'];
	[d1,d2,x1,y1,d5]=textread(filename1,'%n%f%n%n%s','headerlines',2,'delimiter', ',');
	[f1,f2,x21,y21,f5]=textread(filename21,'%n%f%n%n%s','headerlines',2,'delimiter', ',');
	[f1,f2,x22,y22,f5]=textread(filename22,'%n%f%n%n%s','headerlines',2,'delimiter', ',');
	if (length(x1)~=length(x21))||(length(x21)~=length(x22));
		error('error. time demensions among the three files are not same')
	end
	s21(1)=0;
	for i=1:30;
		s21(i+1)=s21(i)+((x21(i+1)-x21(i))^2+(y21(i+1)-y21(i))^2)^0.5;
	end
	v(1)=0;
	for i=1:30;
		v(i+1)=s21(i+1)-s21(i);
	end
	for i=3:30;
		if (v(i+1)>2.5*v(i))&&(v(i+1)-v(i)>1.5);
			co=i;
			break;
		end
	end
	v0=sqrt((x1(co)-x1(1))^2+(y1(co)-y1(1))^2)/(co-1)
	v1=sqrt((x1(co+8)-x1(co+1))^2+(y1(co+8)-y1(co+1))^2)/7

	x2M=(x21+x22)/2;y2M=(y21+y22)/2;
	v2M=sqrt((x2M(end-1)-x2M(co+1))^2+(y2M(end-1)-y2M(co+1))^2)/(length(x2M)-co-2)

	vec_M1=[x1(co)+x1(co+1)-x2M(co)-x2M(co+1),y1(co)+y1(co+1)-y2M(co)-y2M(co+1)]; %%%
	vec_U1=[x1(co)+x1(co+1)-x21(co)-x21(co+1),y1(co)+y1(co+1)-y21(co)-y21(co+1)];
	sitaM1U=acos(vec_M1*vec_U1'/(norm(vec_M1)*norm(vec_U1))); %计算sita1MU

	vec_v0=[x1(co-1)-x1(1),y1(co-1)-y1(1)];
	sita01M=acos(-vec_M1*vec_v0'/(norm(vec_M1)*norm(vec_v0))); %%%

	vec_v1=[x1(co+8)-x1(co+1),y1(co+8)-y1(co+1)];
	sita11M=acos(-vec_M1*vec_v1'/(norm(vec_M1)*norm(vec_v1)));

	vec_v2M=[x2M(end-1)-x2M(co+1),y2M(end-1)-y2M(co+1)];
	sita2M1=acos(-vec_M1*vec_v2M'/(norm(vec_M1)*norm(vec_v2M)));

	vec_co=[x21(co+1)-x22(co+1),y21(co+1)-y22(co+1)]; vec_end=[x21(end-1)-x22(end-1),y21(end-1)-y22(end-1)];
	fai=acos(.*vec_end'/(norm(vec_co)*norm(vec_end))); w=fai/(length(x2M)-co-2) %fai is rotating angle of sphere pair ;right

	v0M=v0*cos(sita01M) %%%
	v1M=v1*cos(sita11M) %%%
	v0t=v0*sin(sita01M)
	v1t=v1*sin(sita11M)
	v2MM=v2M*cos(sita2M1)
	v2Mt=v2M*sin(sita2M1)
	v2MM+abs(v1M);
	abs(v2Mt)+abs(w*49.5)+abs(v1t);

	fai=fai*180/pi
	sita01M=sita01M*180/pi;
	sita11M=sita11M*180/pi;
	sitaM1U=sitaM1U*180/pi;
	sita2M1=sita2M1*180/pi;

	fprintf(fid,'%2s','h1d1-',num2str(j))
	fprintf(fid,' v0M=%6.2f v0t=%6.2f v1M=%6.2f v2M=%6.2f v2MM=%6.2f relative_v=%6.2f relative_vt=%6.2f sita01M=%6.2f sita11M=%6.2f sita2M1=%6.2f sitaM1U=%6.2f ',v0M,v0t,v1M,v2M,v2MM,v2MM+abs(v1M),abs(v2Mt)+abs(v1t),sita01M,sita11M,sita2M1,sitaM1U)	%output information about the experiment every lines.在输出几个重要的角度
	fprintf(fid,'\r\n')
end
fclose(fid)


%%%%%%%%%%%%%%%%%%%%%%近似无偏角碰撞
v0n=[19.6598,20.2402,19.8467,  20.6,20.5661,21.04,20.9084,19.3946,   18.1089,16.6315,16.3998,14.7469,14.7168,13.0964];
v1n=[0.0975,0.2945,0.2635,     0.03,0.4472,0.03,0.044,0.2614,        -0.0184,0.5313,1.0593,0.4653,-0.0190,0.1722];
v2=[18.4452,18.493,18.8192,   18.0033,18.3396,18.1988,17.8744,17.9740,   16,15.3313,14.4346,13.5675,13.1377,11.5662];
%%%%%%%%%%%%%%%%%%%%%%有角碰撞
v0n=[19.3791,18.6439,12.5178,10.712,17.8236,17.7364,18.5031,17.4312,16.0017,14.0484,16.3163]
v1n=[0.1139,0.4263,0.6253,0.8207,0.5778,1.0485,1.0056,0.2147,0.6694,0.7026,0.5679]
v2=[17.2815,17.5576,10.9304,10.4237,16.5783,15.419,16.8788,16.1664,14.1601,11.6354,14.2365]
%%%%%%%%%%%%%%%%%%%%%%第一次碰撞
v0n=[0,8.1037,8,7.8,8.5022,7.8746,8]
v1n=[0,0,0,0,0.3229,0.4941,0.2322]
v2=[0,7.955,7.5,7.5,8.1288,7.3368,7.5374]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%三球在一线的相碰
v0n=[0,8.19,8.356,7.7656]
v1n=[0,3,2.94,2.755]
v2=[0,4.875,5.13,4.9]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%球撞长方体中间
v0n=[0 7.62 8 7.88 8.13]
v1n=[0 0.9889 0.9922 1.33 0.7767]
v2=[0 5.2738 5.5014 5 5.5728]

p=polyfit(v0n,v1n,1);
v0=5:0.1:12;
vt=polyval(p,v0);
plot(v0n,v1n,'o',v0,vt,'-*')

p=polyfit(v0n,v2,1);
v0=0:0.1:8.2;
vt=polyval(p,v0);
plot(v0n,v2,'o',v0,vt,'-*')

p=polyfit(v0n,v2+v1n,1);
v0=0:0.1:8.2;
vt=polyval(p,v0);
plot(v0n,v2+v1n,'o',v0,vt,'-*')
%%%%%%%%%%%%%%%%%%%%%%%%%%拟合，画图
p=polyfit(v0n,v2,1);
v0=7.5:0.1:22;
vt=polyval(p,v0);
plot(v0n,v2,'o',v0,vt,'-*')

p=polyfit(v0n,v2-v1n,1);
v0=7.5:0.1:22;
vt=polyval(p,v0);
plot(v0n,v2-v1n,'o',v0,vt,'-*')


[v1,v2]=solve(m1*v1^2+m2*v2^2+(m1*m2/(m1+m2))*(1-e^2)*v0^2-m1*v0^2,-m1*v0+m1*v1+m2*v2,v1,v2)

