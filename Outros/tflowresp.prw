#include "TOTVS.CH"

function u_TFlowResp()

	Local cGet1 := Space(10)
	Local cGet2 := Space(3)
	Local cGet3 := Space(50)
	local ofont := TFont():New( 'Consolas',,-12 )

	oWnd:= TWindow():New(0, 0, 550, 700, "Exemplo de TFlowLayout", NIL, NIL, NIL, NIL, NIL, NIL, NIL,;
		CLR_BLACK, CLR_WHITE, NIL, NIL, NIL, NIL, NIL, NIL, .T. )

	oLayout1:= tFlowLayout():New(oWnd,CONTROL_ALIGN_TOP,300,15)
	oLayout2:= tFlowLayout():New(oWnd,CONTROL_ALIGN_TOP,300,20)
	//oLayout1:SetColor(,CLR_BLUE)
	//oLayout2:SetColor(,CLR_RED)

	oSay1 := TSay():New(01,01,{||'CÓDIGO'}   ,oLayout1,,ofont,,,,.T.,,,050,15)
	oSay2 := TSay():New(01,01,{||'VERSÃO'}   ,oLayout1,,ofont,,,,.T.,,,035,15)
	oSay3 := TSay():New(01,01,{||'DESCRIÇÃO'},oLayout1,,ofont,,,,.T.,,,450,15)

	oSay1:SetCSS( 'QLabel {margin: 15px 0 0 15px ;}' )
	oSay2:SetCSS( 'QLabel {margin: 15px 0 0 15px ;}' )
	oSay3:SetCSS( 'QLabel {margin: 15px 0 0 15px ;}' )

	oLayout1:AddInLayout(oSay1)
	oLayout1:AddInLayout(oSay2)
	oLayout1:AddInLayout(oSay3)

	oGet1 := TGet():New( 005, 009, { | u | If( PCount() == 0, cGet1, cGet1 := u ) },oLayout2,050, 015, "!@",, 0, ,ofont,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F. ,,"cGet1",,,,  )
	oGet2 := TGet():New( 005, 009, { | u | If( PCount() == 0, cGet2, cGet2 := u ) },oLayout2,035, 015, "!@R N.NN",, 0, ,ofont,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F. ,,"cGet2",,,,  )
	oGet3 := TGet():New( 005, 009, { | u | If( PCount() == 0, cGet3, cGet3 := u ) },oLayout2,450, 015, "!@",, 0, ,ofont,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F. ,,"cGet3",,,,  )

	oGet1:SetCSS( 'QLineEdit {margin: 0 0 0 15px ;}' )
	oGet2:SetCSS( 'QLineEdit {margin: 0 0 0 15px ;}' )
	oGet3:SetCSS( 'QLineEdit {margin: 0 0 0 15px ;}' )

	oLayout2:AddInLayout(oGet1)
	oLayout2:AddInLayout(oGet2)
	oLayout2:AddInLayout(oGet3)

/*****************************************/

	oLayout3:= tFlowLayout():New(oWnd,CONTROL_ALIGN_TOP,300,15)
	oLayout4:= tFlowLayout():New(oWnd,CONTROL_ALIGN_TOP,300,20)

	oSay4 := TSay():New(01,01,{||'CÓDIGO'}   ,oLayout3,,ofont,,,,.T.,,,045,15)
	oSay5 := TSay():New(01,01,{||'VERSÃO'}   ,oLayout3,,ofont,,,,.T.,,,035,15)
	oSay6 := TSay():New(01,01,{||'DESCRIÇÃO'},oLayout3,,ofont,,,,.T.,,,450,15)

	oSay4:SetCSS( 'QLabel {margin: 15px 0 0 15px ;}' )
	oSay5:SetCSS( 'QLabel {margin: 15px 0 0 15px ;}' )
	oSay6:SetCSS( 'QLabel {margin: 15px 0 0 15px ;}' )

	oLayout3:AddInLayout(oSay4)
	oLayout3:AddInLayout(oSay5)
	oLayout3:AddInLayout(oSay6)

	cGet4 := 'aaaaaaaaaaaaaaaaaaaaaa'
	cGet5 := 'aaaaaaaaaaaaaaaaaaaaaa'
	cGet6 := 'aaaaaaaaaaaaaaaaaaaaaa'

	oGet4 := TGet():New( 005, 009, { | u | If( PCount() == 0, cGet4, cGet4 := u ) },oLayout4,045, 015, "!@",, 0, ,ofont,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F. ,,"cGet4",,,,  )
	oGet5 := TGet():New( 005, 009, { | u | If( PCount() == 0, cGet5, cGet5 := u ) },oLayout4,035, 015, "!@",, 0, ,ofont,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F. ,,"cGet5",,,,  )
	oGet6 := TGet():New( 005, 009, { | u | If( PCount() == 0, cGet6, cGet6 := u ) },oLayout4,450, 015, "!@",, 0, ,ofont,.F.,,.T.,,.F.,,.F.,.F.,,.F.,.F. ,,"cGet6",,,,  )

	oGet4:SetCSS( 'QLineEdit {margin: 0 0 0 15px ;}' )
	oGet5:SetCSS( 'QLineEdit {margin: 0 0 0 15px ;}' )
	oGet6:SetCSS( 'QLineEdit {margin: 0 0 0 15px ;}' )

	oLayout4:AddInLayout(oGet4)
	oLayout4:AddInLayout(oGet5)
	oLayout4:AddInLayout(oGet6)


	oWnd:Activate("MAXIMIZED")
return


user function recurciv( nIdent )

	local nX   := 0
	local aLst := { 'OI', 1, .T., Date() }
	local cIDent := ''

	Default nIdent := 1

	cIdent := Replicate( '-',  nIdent * 5 )

	for nX := 1 to len( aLst )

		if ValType( aLst[ nX ] ) == 'A'

			//ConOut( aLst[ nX ] )

		else

			ConOut( cValToChar( aLst[ nX ] ) )

		end if

	next nX

return
