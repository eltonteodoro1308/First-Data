#include 'totvs.ch'
#include 'fwbrowse.ch'

user function tsttwbrw()

Local oBrowse
Local oButton
Local oColumn
Local oDlg
Local aLista := {}
rpcsetenv('99','01')
aAdd(aLista,{'LAY001','123','LAYOUT 001/123'})
aAdd(aLista,{'LAY002','123','LAYOUT 002/123'})
aAdd(aLista,{'LAY003','123','LAYOUT 003/123'})

//-------------------------------------------------------------------
// Abertura da tabela
//-------------------------------------------------------------------

//DbUseArea(.T.,,"SX2990","SX2",.T.,.F.)
//DbSetOrder(1)

//-------------------------------------------------------------------
// Define a janela do Browse
//-------------------------------------------------------------------

DEFINE MSDIALOG oDlg FROM 0,0 TO 600,800 PIXEL	

//-------------------------------------------------------------------	
// Define o Browse	
//-------------------------------------------------------------------	

DEFINE FWFORMBROWSE oBrowse DATA ARRAY ARRAY aLista OF oDlg		

//--------------------------------------------------------		
// Cria uma coluna de marca/desmarca		
//--------------------------------------------------------		

//ADD MARKCOLUMN oColumn DATA { || If(.T./* Função com a regra*/,'LBOK','LBNO') } DOUBLECLICK { |oBrowse| /* Função que atualiza a regra*/ } HEADERCLICK { |oBrowse| /* Função executada no clique do header */ } OF oBrowse		

//--------------------------------------------------------		
// Cria uma coluna de status		
//--------------------------------------------------------		

//ADD STATUSCOLUMN oColumn DATA { || If(.T./* Função com a regra*/,'BR_VERDE','BR_VERMELHO') } DOUBLECLICK { |oBrowse| /* Função executada no duplo clique na coluna*/ } OF oBrowse		

//--------------------------------------------------------		
// Adiciona legenda no Browse		
//--------------------------------------------------------		

//ADD LEGEND DATA 'X2_CHAVE $ "AA1|AA2"'    COLOR "GREEN" TITLE "Chave teste 1" OF oBrowse		
//ADD LEGEND DATA '!(X2_CHAVE $ "AA1|AA2")' COLOR "RED"   TITLE "Chave teste 2" OF oBrowse		

//-------------------------------------------------------------------		
// Adiciona as colunas do Browse		
//-------------------------------------------------------------------		

ADD BUTTON oButton TITLE "Botão 1" ACTION { || MsgAlert(oBrowse:At()) } OPERATION 3 OF oBrowse		
ADD BUTTON oButton TITLE "Botão 2" ACTION { || MsgAlert(oBrowse:At()) } OPERATION 4 OF oBrowse		

//-------------------------------------------------------------------		
// Adiciona as colunas do Browse		
//-------------------------------------------------------------------		

ADD COLUMN oColumn DATA {|oBrowse| aLista[oBrowse:At(), 1] } TITLE "Código"     SIZE  3 OF oBrowse		
ADD COLUMN oColumn DATA {|oBrowse| aLista[oBrowse:At(), 2] } TITLE "Versão"   SIZE 10 OF oBrowse		
ADD COLUMN oColumn DATA {|oBrowse| aLista[oBrowse:At(), 3] } TITLE "Descrição" SIZE 40 OF oBrowse	

//-------------------------------------------------------------------	
// Ativação do Browse	
//-------------------------------------------------------------------	

ACTIVATE FWFORMBROWSE oBrowse

//-------------------------------------------------------------------
// Ativação do janela
//-------------------------------------------------------------------
ACTIVATE MSDIALOG oDlg CENTERED

return
