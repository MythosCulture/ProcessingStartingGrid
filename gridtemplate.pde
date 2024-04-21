Cell[] cells;
int rows, cols;
float cellSize;
color bk = #EEE5E9;

void setup() {
  size(700, 700);
  background(bk);
  
  cellSize = 100; //width and height of cell
  cols = int(width / cellSize + 1);
  rows = int(height / cellSize + 1);
}

void draw() {
  CreateGrid(); 
  
  for (Cell cell : cells){
    ///Draw here
    noStroke();
    triangle(cell.left_x, cell.top_y,cell.left_x, cell.bott_y,cell.right_x, cell.bott_y);
    ///

    noLoop();
}

void CreateGrid() {
    cells = new Cell[rows * cols];
    
    int index = 0;
    for (int r = 0; r < rows; r++) {
        for (int c = 0; c < cols; c++) {
            
            float centerX = c * cellSize;
            float centerY = r * cellSize;
            
            cells[index] = new Cell(centerX,centerY,index);
            
            index++;
        }
    }
}

class Cell {
    //Add variables to cells as needed...
    int gridIndex;
    float x, y; //center of cell
    float left_x, right_x, top_y, bott_y;
    
    Cell(float x, float y, int gridIndex) {
        this.x = x;
        this.y = y;
        this.gridIndex = gridIndex;
        
        this.left_x = this.x - cellSize/2;
        this.right_x = this.x + cellSize/2;
        this.top_y = this.y - cellSize/2;
        this.bott_y = this.y + cellSize/2; 
    }
}
