#include "TOTVS.CH"

User Function TBtnBmp2()

	cDescription := space(50)

	DEFINE DIALOG oDlg TITLE "Exemplo TBtnBmp2" FROM 180,180 TO 550,700 PIXEL

	tp1 := tPanel():New(01,01,,oDlg,,.T.,,,,100,100,.T.,.T.)
	tp2 := tPanel():New(01,102,,oDlg,,.T.,,,,100,100,.T.,.T.)

	nRow := 50
	nCol := 50

	oBtn1 := TBtnBmp2():New( nrow*2,ncol*2,50,50,'copyuser',,,,{||Alert("Botão 01")},tp1/*,,,.T.*/ )
	//oBtn2 := TBtnBmp2():New( 075,32,26,26,'critica',,,,{||Alert("Botão 02")},oDlg,,,.T. )

	//@ 015, 02 GET cDescription OF oDlg SIZE 100,010  PIXEL

	TGet():New( nrow,ncol,{||cDescription},tp2,26,26,"@!",,0,,,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F.,,cDescription,,,, )




	ACTIVATE DIALOG oDlg CENTERED

Return
