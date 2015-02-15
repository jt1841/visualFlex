void serialEvent(String serialINPUT){
int[] arr = {0,0,0,0,0};
if (serialINPUT.length() < 15)
{
  arr = xPosArr;
}
else
{
  for (int i = 0; i < 5; i = i + 1)
  {
    newString = serialINPUT.substring(3*i,3*i+3);
    println(serialINPUT);
    arr[i] = int(newString);
    
  }
}
  
  xPosArr = arr;
}
