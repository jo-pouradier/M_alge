 clear variables;close all;
% construction des matrices A et B (SANS BOUCLE FOR NI WHILE)
A=diag(3*ones(1,3),1) + diag(-2*ones(1,3),-1) + diag([1 2 3 4],0); 

B=2*ones(3,4);

% concaténation des matrices A et B
M=[A;B];

% décomposition en valeurs singulières de M
[u,s,v]=svd(M);

% reconstruction de la matrice M
M2= zeros(7,4);


for i=1:rank(s)
 M2= M2 + s(i,i) * u(:,i)* v(:,i)';
end

%image=input("nom de l'image a ouvrir: ");
image='einstein.jpg';
k=[5,40,100,200];
E = imread(image);
figure(1)
imshow(E);
E=E(:,:,1);
[m,n]=size(E);

[U,S,V]=svd(double(E));

figure(2)
plot(1:rank(S),diag(S))
TO=[];
for p=1:4
    M3=zeros(m,n);
    tab=k(p);
    tab
    for i=1:tab
     M3= M3 + S(i,i) * U(:,i)* V(:,i)';
    end
    figure(3);
    subplot(2,2,p);imshow(uint8(M3));
    to=1-(tab+tab*m+tab*n)/(m*n);
    TO=[TO,to];
end

figure(4);
plot(k,TO,'-*')


 



