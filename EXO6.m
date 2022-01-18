 clear variables;close all;
% construction des matrices A et B (SANS BOUCLE FOR NI WHILE)
question=2;
switch question
    case 1 %cas d'une matrice
    
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
    
    
    case 2 %cas d'une image en gris
    
        %image=input("nom de l'image a ouvrir: ");
        image='einstein.jpg'; %nom d'une image a compresser de n'importe quelle taille
        k=[5,40,100,200];
        E = imread(image);
        figure(1)
        imshow(E);
        E=E(:,:,1); %on prend qu'un canal de couleur de l'image (RGB)
        [m,n]=size(E);

        [U,S,V]=svd(double(E));

        figure(2)
        plot(1:rank(S),diag(S))
        TO=[];
        for p=1:4
            M3=zeros(m,n); %initialisation
            tab=k(p); 
            tab
            for i=1:tab
             M3= M3 + S(i,i) * U(:,i)* V(:,i)'; %reconstruction de l'image compressée
            end
            figure(3);
            subplot(2,2,p);imshow(uint8(M3)); 
            to=1-(tab+tab*m+tab*n)/(m*n); %taux de compression 
            TO=[TO,to];
        end

        figure(4);
        plot(k,TO,'-*') %on plot les taux de compression en fct de k, c'est lineaire !


 



