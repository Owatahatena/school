int yokoN=810;
int tateN=640;
int masu;
int mae=0;
int ushiro=0;


void setup(){
  size(810,640);
  masu = 10;
  yokoN = width/masu;
  tateN = height/masu;
  fill(255);
  
}

void draw(){
  int [][]s = new int[yokoN][tateN];
  for(int i = 0 ; i < tateN; i++){
    for(int j = 0; j < yokoN; j++){
      s[j][i] = 0;
    }
  }
  
  s[yokoN/2][0] = 1;
  
  for(int i = 0; i < tateN; i++){
    for(int j= 2; j < yokoN; j++){
        if(i == 63) break;
        if(j == 79) break;
        mae = j-1; ushiro=j+1;
        if(s[j][i] == 0){
          if(s[mae][i] == 1 || s[ushiro][i] == 1){
            s[j][i+1] = 1;
          }
        }
        if(s[j][i]== 1){
          if(s[mae][i] == 0 && s[ushiro][i] == 0){
            s[j][i+1] = 1;
          }
          if(s[mae][i] == 1 && s[ushiro][i] == 0){
            s[j][i+1] = 1;
          }
        }
      }
    }
  
  
  
  for(int i=0; i <yokoN; i++){
    for(int j =0; j < tateN; j++){
      if(s[i][j] == 1){
        fill(255,0,0);
      }
      else{
        fill(0,0,0);
      }
      stroke(255);
      rect(i*masu, j*masu, masu, masu);
    }
  }
  PImage saveImage = get(0,0, width, height);
  saveImage.save("./test1.png");
}