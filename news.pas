
program CreateBitmap;

uses
  SysUtils;

type
  TRGBQuad = packed record
    Blue, Green, Red, Reserved: Byte;
  end;

  TBitmapFileHeader = packed record
    bfType: Word;
    bfSize: LongInt;
    bfReserved1: Word;
    bfReserved2: Word;
    bfOffBits: LongInt;
  end;

  TBitmapInfoHeader = packed record
    biSize: LongInt;
    biWidth: LongInt;
    biHeight: LongInt;
    biPlanes: Word;
    biBitCount: Word;
    biCompression: LongInt;
    biSizeImage: LongInt;
    biXPelsPerMeter: LongInt;
    biYPelsPerMeter: LongInt;
    biClrUsed: LongInt;
    biClrImportant: LongInt;
  end;

const
  VGAColors: array[0..15] of TRGBQuad = (
    (Blue: 0; Green: 0; Red: 0; Reserved: 0),           // 0 - Preto
    (Blue: 128; Green: 0; Red: 0; Reserved: 0),         // 1 - Azul escuro
    (Blue: 0; Green: 128; Red: 0; Reserved: 0),         // 2 - Verde escuro
    (Blue: 128; Green: 128; Red: 0; Reserved: 0),       // 3 - Azul claro
    (Blue: 0; Green: 0; Red: 128; Reserved: 0),         // 4 - Vermelho escuro
    (Blue: 128; Green: 0; Red: 128; Reserved: 0),       // 5 - Magenta
    (Blue: 0; Green: 128; Red: 128; Reserved: 0),       // 6 - Ciano
    (Blue: 192; Green: 192; Red: 192; Reserved: 0),     // 7 - Cinzento claro
    (Blue: 128; Green: 128; Red: 128; Reserved: 0),     // 8 - Cinzento escuro
    (Blue: 255; Green: 0; Red: 0; Reserved: 0),         // 9 - Azul forte
    (Blue: 0; Green: 255; Red: 0; Reserved: 0),         // 10 - Verde forte
    (Blue: 255; Green: 255; Red: 0; Reserved: 0),       // 11 - Amarelo
    (Blue: 0; Green: 0; Red: 255; Reserved: 0),         // 12 - Vermelho forte
    (Blue: 255; Green: 0; Red: 255; Reserved: 0),       // 13 - Magenta forte
    (Blue: 0; Green: 255; Red: 255; Reserved: 0),       // 14 - Ciano forte
    (Blue: 255; Green: 255; Red: 255; Reserved: 0)      // 15 - Branco
  );

var
  largura, altura, cor, i, y: Integer;
  bmp: File;
  fileHeader: TBitmapFileHeader;
  infoHeader: TBitmapInfoHeader;
  pixel: TRGBQuad;
  rowData: array of Byte;
  rowSize: Integer;
begin
  WriteLn(chr(27)+'c');
  WriteLn(chr(27)+'[43;30m');
  Write('Largura: ');
  ReadLn(largura);
  Write('Altura: ');
  ReadLn(altura);
  Write('Cor VGA (0-15): ');
  ReadLn(cor);

  if (cor < 0) or (cor > 15) then
  begin
    WriteLn('Cor inválida.');
    Halt(1);
  end;

  pixel := VGAColors[cor];
  rowSize := largura * 4;  // 32 bits = 4 bytes
  SetLength(rowData, rowSize);

  // preencher linha com a cor
  for i := 0 to largura - 1 do
  begin
    rowData[i * 4 + 0] := pixel.Blue;
    rowData[i * 4 + 1] := pixel.Green;
    rowData[i * 4 + 2] := pixel.Red;
    rowData[i * 4 + 3] := pixel.Reserved;
  end;

  // Preencher cabeçalhos
  fileHeader.bfType := $4D42; // 'BM'
  fileHeader.bfOffBits := SizeOf(fileHeader) + SizeOf(infoHeader);
  fileHeader.bfSize := fileHeader.bfOffBits + rowSize * altura;
  fileHeader.bfReserved1 := 0;
  fileHeader.bfReserved2 := 0;

  infoHeader.biSize := SizeOf(infoHeader);
  infoHeader.biWidth := largura;
  infoHeader.biHeight := altura;
  infoHeader.biPlanes := 1;
  infoHeader.biBitCount := 32;
  infoHeader.biCompression := 0;
  infoHeader.biSizeImage := rowSize * altura;
  infoHeader.biXPelsPerMeter := 0;
  infoHeader.biYPelsPerMeter := 0;
  infoHeader.biClrUsed := 0;
  infoHeader.biClrImportant := 0;

  Assign(bmp, 'new.bmp');
  Rewrite(bmp, 1); // modo binário

  // escrever cabeçalhos
  BlockWrite(bmp, fileHeader, SizeOf(fileHeader));
  BlockWrite(bmp, infoHeader, SizeOf(infoHeader));

  // escrever linhas de baixo para cima
  for y := 0 to altura - 1 do
    BlockWrite(bmp, rowData[0], rowSize);

  Close(bmp);
  WriteLn('Imagem "new.bmp" criada com sucesso.');
end.
