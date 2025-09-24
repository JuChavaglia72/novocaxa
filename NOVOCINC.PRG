
/*
TITULO     : Controle de Caixa - Versao 3.20030922
DATA       : 22/09/03
PROGRAMA   : NOVOCINC.PRG
COMENTARIO : MENU DE CADASTROS
*/
 
#include "NOVOC.CH"
#include "NOVOCMOU.CH"
**
**BI [INI] INC.B01
**BI [FIM] INC.B01
**
MENSAGEM( "Tecle <ESC> para sair" )
menu:ADD( "Clientes", NOVOCI01() )
menu:ADD( "-" )
menu:ADD( "Servicos", NOVOCI02() )
menu:ADD( "-" )
menu:ADD( "Movimentos", NOVOCI03() )
menu:RODA()
CLOSE DATABASES
**
**BI [INI] INC.B02
**BI [FIM] INC.B02
**
 
/* Final do programa NOVOCINC.PRG */