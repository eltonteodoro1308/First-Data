User Function leArq()
	// Abre o arquivo
	nHandle := FT_FUse("c:\temp\atfa102.txt")
	aArr := {}
	// Se houver erro de abertura abandona processamento
	if nHandle = -1
		return
	endif
	// Posiciona o cursor em uma determinada posição do arquivo
	//FT_FGoto( 11 )
	//cLine  := FT_FReadLn()
	// Retorna a linha posicionada
	//MsgAlert( "Linha: " + cLine )
	// Fecha o Arquivo
	FT_FGoTop()

	ConOut( '********** Início' )

	while ! FT_FEOF()


		aAdd( aArr, STRTOKARR2( FT_FReadLn(), ";", .T. )  )

		ConOut( FT_FReadLn() )

		FT_FSKIP()

	end

	ConOut( '********** Fim' )

	FT_FUSE()

return


/*
=> Posiciona em determinada linha
obrowse:nat = n
obrowse:refresh()

=> Ordena grid
asort( aLinesBrw,,, {|x,y| x[1]<y[1] } )
obrowse:refresh()

*/
