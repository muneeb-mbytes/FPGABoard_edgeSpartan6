def segdecoder(n):
    if(n==0):
        return "00000011"
    elif(n==1):
        return "10011111"  
    elif(n==2):
        return "00100101"
    elif(n==3):
        return "00001101"
    elif(n==4):
        return "10011001"
    elif(n==5):
        return "01001001"
    elif(n==6):
        return "01000001"
    elif(n==7):
        return "00011111"
    elif(n==8):
        return "00000001"
    else :
        return "00001001"
    

f= open('srgdecoder.txt','a')
start=int(input("Enter start value :"))
end = int ( input ("Enter end value :"))
digits=len(str(end))

for i in range (start,end+1):
    I=str(i)
    f.write(I)
    f.write(" : ")
    k=i
    for j in range(digits,0,-1):
        value=k//(10**(digits-1))
        k=k%10
        f.write(segdecoder(value))
        f.write("_")
        
    f.write("\n")
f.close()
