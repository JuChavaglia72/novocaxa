
/*
TITULO     : Controle de Caixa - Versao 3.20030922
DATA       : 22/09/03
PROGRAMA   : NOVOCC01.PRG
COMENTARIO : MANUTENCAO (Clientes)
*/
 
#include "NOVOC.CH"
#include "NOVOCMOU.CH"
SET DELETED OFF
M->MOSTRA_RESULTADO := .T.
**
**BI [INI] C01.B01
**BI [FIM] C01.B01
**
MENSAGEM( "Aguarde abertura de arquivos" )
USE CADCLI INDEX CADCL001, CADCL002, CADCL003 NEW
SELE CADCLI  
**
**BI [INI] C01.B02
**BI [FIM] C01.B02
**
SET ORDER TO 1
PRIVATE CODIGO, RAZAO, ENDERECO, BAIRRO, CIDADE, ESTADO, CNPJ, TELEFONES
PRIVATE ATIVOINATI
COR( "MENU" )
@ LIN_MENU, 00
@ LIN_MENU,01 SAY "Manuten‡„o ³ Clientes"
JANELA( 03, 02, 21, 77, "Clientes" )
L_CON := L_SOM; C_CON := C_SOM
//
// -> Monta janela do TBROWSE
COR( "MENU" )
@ 05, 04 CLEAR TO 19, 75
@ 05, 04 SAY SUBS( TB_JANELA, 1, 1 ) +;
             REPL( SUBS( TB_JANELA, 2, 1 ), 70 ) + SUBS( TB_JANELA, 3, 1 )
@ 06, 04 SAY SUBS( TB_JANELA, 12, 1 )
@ 06, 75 SAY SUBS( TB_JANELA, 4, 1 )
@ 07, 04 SAY SUBS( TB_JANELA, 11, 1 )
@ 07, 75 SAY SUBS( TB_JANELA, 5, 1 )
FOR CONTAR = 8 TO 18
   @ CONTAR, 04 SAY SUBS( TB_JANELA, 10, 1 )
   @ CONTAR, 75 SAY SUBS( TB_JANELA, 6, 1 )
NEXT
@ 19, 04 SAY SUBS( TB_JANELA, 9, 1 ) +;
             REPL( SUBS( TB_JANELA, 8, 1 ), 70 ) + SUBS( TB_JANELA, 7, 1 )
//
// -> Define as rotinas a serem usadas pelo TBROWSE
ROTI_NAS := { { | X | CARREG01( X ) },;
              { | X | CARGET01( X ) },;
              { || SALVAR01() } }
GRA_VAR := {}
//
// -> Define as colunas para o TBROWSE
OB_COLUN := {}
AADD( OB_COLUN, TBCOLUMNNEW( "Codigo", { || TRAN( CADCLI->CODIGO, "@!" ) } ) )
AADD( OB_COLUN, TBCOLUMNNEW( "Razao Social", { || TRAN( CADCLI->RAZAO, "@!" ) } ) )
AADD( OB_COLUN, TBCOLUMNNEW( "CNPJ/CEI/CPF", { || TRAN( CADCLI->CNPJ, "@!" ) } ) )
//
// -> Mostra a tela BROWSE e sai retornando o controle ao programa
BRO_WSE( .T. )
M->CNPJ := SPACE( 18 )
ED_JAN := {}
AADD( ED_JAN, { "Razao Social", M->CNPJ, "@!", 18,;
      { | DADOS | M->CNPJ := DADOS } } )
**
**BI [INI] C01.B03
**BI [FIM] C01.B03
**
WHILE .T.
   **
   **BI [INI] C01.B04
   **BI [FIM] C01.B04
   **
   IF EDIT_JAN( ED_JAN ) = .F.
      EXIT
   ENDIF
   SEEK TRIM( M->CNPJ )
   IF EOF()
      BEEP()
      MENSAGEM( "Dados n„o encontrados", 3 )
      LOOP
   ENDIF
   MENSAGEM( "Posicione sobre o registro desejado e tecle <ENTER>" )
   //
   // -> Edita tela BROWSE
   BRO_WSE()
ENDDO
SET DELETED ON
MOUSE( DESLIGA )
RESTSCREEN( LIN_MENU + 1, 00, MAXROW() - 1, MAXCOL(), TELA_PRI )
MOUSE( LIGA )
SET DELETED ON
**
**BI [INI] C01.B05
**BI [FIM] C01.B05
**
 
/* Final do programa NOVOCC01.PRG */