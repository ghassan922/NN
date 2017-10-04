function nn()
%Training Data Preparation
   
    load 'chainCode.mat';
   
    m1=ones(10,5);
    m1=m1*-1;m2=m1;m3=m1;m4=m1;m5=m1;m6=m1;m7=m1;m8=m1;m9=m1;m10=m1;
    m1(1,:)=1;m2(2,:)=1;m3(3,:)=1;m4(4,:)=1;m5(5,:)=1;m6(6,:)=1;
    m7(7,:)=1;m8(8,:)=1;m9(9,:)=1;m10(10,:)=1;
    %m11 = [1 1 1 1 1 1 1 1 1 1];
    %m11=m11';
    y=[m1 m2 m3 m4 m5 m6 m7 m8 m9 m10];
    
    
%**************************************************************************

    net=newff(matrix,y,[8 5 8] );

%**************************************************************************
%Training the neural network
%    load 'n.mat';
    net.trainparam.goal=0.02;
    net.trainparam.epochs=500;
    net_train=train(net,matrix,y);
    
%**************************************************************************
%Test and calculate the accuracy of the neural network  
    
    [test,v]=create(0,1,2,3,4,5,6,7,8,9);
    %size(test)
    result=sim(net_train,test)
    [m ind]=max(result)
    count=0;
    for i=1:10
       if(ind(:,i)==v(:,i)+1)
           count=count+1;
       end
    end
    accuracy=count*10
    save 'n.mat' net;
end

