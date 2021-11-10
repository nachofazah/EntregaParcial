import plantas.*
import parcelas.*



object inta {
	
	const property parcelas = []
	
	method promedioDePlantasPorParcela() = parcelas.map({parcela => parcela.plantas().size()}).sum() / parcelas.size()
	
	method masAutosustentables() = parcelas.filter({parcela => parcela.plantas().size() >= 4})
	
	
}
