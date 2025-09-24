
/*
TITULO     : Controle de Caixa - Versao 3.20030922
DATA       : 22/09/03
PROGRAMA   : NOVOCR03.PRG
COMENTARIO : RELATORIO (Numerica)
*/
 
#include "NOVOC.CH"
#include "NOVOCMOU.CH"
**
**BI [INI] R03.B01
**BI [FIM] R03.B01
**
***
*** Inicio do bloco de substitui‡„o R032.B
MENSAGEM( "Aguarde abertura de arquivos" )
USE CADCLI INDEX CADCL001,CADCL002,CADCL003 NEW
*** Final do bloco de substitui‡„o R032.B
***
MENSAGEM( "Tecle <ESC> para retornar" )
COR( "MENU" )
@ LIN_MENU, 00
@ LIN_MENU, 01 SAY "Relat¢rio ³ Numerica"
SELE CADCLI  
SET ORDER TO 2
**
**BI [INI] R03.B02
**BI [FIM] R03.B02
**
GOTO TOP
***
*** Inicio do bloco de substitui‡„o R033.B
SET FILTER TO ATIVOINATI='A'
IF !(ATIVOINATI='A')
   SKIP
ENDIF
*** Final do bloco de substitui‡„o R033.B
***
**
**BI [INI] R03.B05
**BI [FIM] R03.B05
**
NUM_RELATORIO := 1
//
// -> Tipo do relatorio
relatorio:TIPO := FICHA
//
// -> Define cabecalhos do relatorio
relatorio:ADDTITULO( "CONTROLE DE CAIXA" )
relatorio:ADDTITULO( "RELATORIO DE CLIENTES EM ORDEM NUMERICA" )
//
// -> Define reducao de caracter
//
// -> Define margem do papel
relatorio:LIN_SUPERIOR := 1
relatorio:LIN_INFERIOR := 61
relatorio:COL_INICIAL := 0
//
// -> Define os campos ou expressoes a serem impressos
relatorio:ADD( "", CADCLI->CODIGO, 1, 1, "@!" )
relatorio:ADD( "-", CADCLI->RAZAO, 1, 6, "@!" )
relatorio:ADD( "", CADCLI->ENDERECO, 2, 1, "@!" )
relatorio:ADD( "", CADCLI->BAIRRO, 3, 1, "@!" )
relatorio:ADD( "", CADCLI->CIDADE, 4, 1, "@!" )
relatorio:ADD( "-", CADCLI->ESTADO, 4, 22, "@!" )
relatorio:ADD( "CNPJ/CEI/CPF-", CADCLI->CNPJ, 5, 1, "@!" )
//
// -> Executa impressao do objeto relatorio
**
**BI [INI] R03.B07
**BI [FIM] R03.B07
**
relatorio:RODA()
**
**BI [INI] R03.B08
**BI [FIM] R03.B08
**
//
// -> Desativa SET FILTER
SELE CADCLI  
SET FILTER TO 
MOUSE( DESLIGA )
RESTSCREEN( LIN_MENU + 1, 00, 23, 79, TELA_PRI )
MOUSE( LIGA )
**
**BI [INI] R03.B09
**BI [FIM] R03.B09
**
 
/* Final do programa NOVOCR03.PRG */