{Alunos: Gabriel Sebold e Leonardo Casa Nova}

{Fazer um sistema, usando descritores para gerenciar as filas de atendimento da empresa
Copytech: fila mono, fila color e fila plotter, com capacidade máxima respectiva de 10, 5 e 3.
O sistema deve gerenciar entradas/saídas/consultas
nas filas além de informar a quantidade de pessoas entrantes, atendidas e rejeitadas (quando a fila está cheia) para cada uma das filas.}

program SistemaFilasCopytech;

uses crt;

const
  MAX_MONO = 10;
  MAX_COLOR = 5;
  MAX_PLOTTER = 3;

type
  TFila = record
    itens: array[1..100] of Integer;
    inicio, fim: Integer;
    quantidade: Integer;
    capacidadeMaxima: Integer;
    totalEntrantes: Integer;
    totalAtendidos: Integer;
    totalRejeitados: Integer;
  end;

var
  filaMono, filaColorida, filaPlotter: TFila;
  opcao: Integer;
  novoClienteID: Integer;
  clienteAtendidoID: Integer;
  sair: Boolean;
  
//------------------------------------------------------------------------------------
//Procedure de Inicialização

procedure InicializarFila(var fila: TFila; capacidade: Integer);
begin
  fila.inicio := 1;
  fila.fim := 0;
  fila.quantidade := 0;
  fila.capacidadeMaxima := capacidade;
  fila.totalEntrantes := 0;
  fila.totalAtendidos := 0;
  fila.totalRejeitados := 0;
end;

//------------------------------------------------------------------------------------
//Funções de Cheia e Vazia

function FilaCheia(var fila: TFila): Boolean;
begin
  FilaCheia := (fila.quantidade = fila.capacidadeMaxima);
end;

function FilaVazia(var fila: TFila): Boolean;
begin
  FilaVazia := (fila.quantidade = 0);
end;

//------------------------------------------------------------------------------------
//Procedure de Entradas

procedure EntrarNaFila(var fila: TFila; clienteID: Integer);
begin
  if FilaCheia(fila) then
    fila.totalRejeitados := fila.totalRejeitados + 1
  else
    begin
      fila.fim := fila.fim mod fila.capacidadeMaxima + 1;
      fila.itens[fila.fim] := clienteID;
      fila.quantidade := fila.quantidade + 1;
      fila.totalEntrantes := fila.totalEntrantes + 1;
    end;
end;

//------------------------------------------------------------------------------------
//Procedure de Atendimento

function AtenderDaFila(var fila: TFila; var clienteID: Integer): Boolean;
begin
  if FilaVazia(fila) then
    AtenderDaFila := False
  else
    begin
      clienteID := fila.itens[fila.inicio];
      fila.inicio := fila.inicio mod fila.capacidadeMaxima + 1;
      fila.quantidade := fila.quantidade - 1;
      fila.totalAtendidos := fila.totalAtendidos + 1;
      AtenderDaFila := True;
    end;
end;

//------------------------------------------------------------------------------------
//Procedure de Consulta

procedure ConsultarFila(var fila: TFila);
begin
  Writeln('Pessoas na fila: ', fila.quantidade);
  Writeln('Total de entrantes: ', fila.totalEntrantes);
  Writeln('Total de atendidos: ', fila.totalAtendidos);
  Writeln('Total de rejeitados: ', fila.totalRejeitados);
end;

//------------------------------------------------------------------------------------
//Procedure do Menu

procedure MostrarMenu;
begin
  Writeln;
  Writeln('--- Sistema de Filas Copytech ---');
  Writeln('1. Entrar cliente na fila Mono');
  Writeln('2. Entrar cliente na fila Colorida');
  Writeln('3. Entrar cliente na fila Plotter');
  Writeln('4. Atender cliente na fila Mono');
  Writeln('5. Atender cliente na fila Colorida');
  Writeln('6. Atender cliente na fila Plotter');
  Writeln('7. Consultar fila Mono');
  Writeln('8. Consultar fila Colorida');
  Writeln('9. Consultar fila Plotter');
  Writeln('0. Sair');
  Write('Escolha uma opcao: ');
end;

//------------------------------------------------------------------------------------
//Programa Principal
//------------------------------------------------------------------------------------

begin
  InicializarFila(filaMono, MAX_MONO);
  InicializarFila(filaColorida, MAX_COLOR);
  InicializarFila(filaPlotter, MAX_PLOTTER);
  novoClienteID := 1;
  sair := False;

  while not sair do
  begin
    clrscr;
    MostrarMenu;
    Readln(opcao);

    if opcao = 1 then
    begin
      EntrarNaFila(filaMono, novoClienteID);
      Writeln('Cliente ', novoClienteID, ' entrou na fila Mono.');
      novoClienteID := novoClienteID + 1;
    end
    else if opcao = 2 then
    begin
      EntrarNaFila(filaColorida, novoClienteID);
      Writeln('Cliente ', novoClienteID, ' entrou na fila Colorida.');
      novoClienteID := novoClienteID + 1;
    end
    else if opcao = 3 then
    begin
      EntrarNaFila(filaPlotter, novoClienteID);
      Writeln('Cliente ', novoClienteID, ' entrou na fila Plotter.');
      novoClienteID := novoClienteID + 1;
    end
    else if opcao = 4 then
    begin
      if AtenderDaFila(filaMono, clienteAtendidoID) then
        Writeln('Cliente ', clienteAtendidoID, ' atendido na fila Mono.')
      else
        Writeln('Fila Mono vazia.');
    end
    else if opcao = 5 then
    begin
      if AtenderDaFila(filaColorida, clienteAtendidoID) then
        Writeln('Cliente ', clienteAtendidoID, ' atendido na fila Colorida.')
      else
        Writeln('Fila Colorida vazia.');
    end
    else if opcao = 6 then
    begin
      if AtenderDaFila(filaPlotter, clienteAtendidoID) then
        Writeln('Cliente ', clienteAtendidoID, ' atendido na fila Plotter.')
      else
        Writeln('Fila Plotter vazia.');
    end
    else if opcao = 7 then
    begin
      Writeln('--- Fila Mono ---');
      ConsultarFila(filaMono);
    end
    else if opcao = 8 then
    begin
      Writeln('--- Fila Colorida ---');
      ConsultarFila(filaColorida);
    end
    else if opcao = 9 then
    begin
      Writeln('--- Fila Plotter ---');
      ConsultarFila(filaPlotter);
    end
    else if opcao = 0 then
    begin
      Writeln('Encerrando sistema.');
      sair := True;
    end
    else
      Writeln('Opcao invalida.');

    if not sair then
    begin
      Writeln;
      Write('Pressione ENTER para continuar...');
      Readln;
    end;
  end;
end.
