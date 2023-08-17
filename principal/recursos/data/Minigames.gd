extends Resource


const minigame_packs = {
	"Class of 2023": ["res://microjogos/2023S1/projeto-enzo-bertoloti/cenas/main.tscn", "res://microjogos/2023S1/projeto_vinicius_carvalho/cenas/mapa.tscn", "res://microjogos/2023S1/projeto-tiagoperrupato/cenas/main.tscn", "res://microjogos/2023S1/projeto-guglielmo-223300/cenas/main.tscn", "res://microjogos/2023S1/bis-limao/cenas/main.tscn", "res://microjogos/2023S1/GamutoVeiga/cenas/main.tscn", "res://microjogos/2023S1/projeto-brabesf/cenas/main.tscn", "res://microjogos/2023S1/projeto-jose-victor/cenas/main.tscn", "res://microjogos/2023S1/projeto-thedeas/cenas/main.tscn", "res://microjogos/2023S1/projeto-yan-oliveira/cenas/main.tscn", "res://microjogos/2023S1/projeto_leonardo_valente/cenas/main.tscn", "res://microjogos/2023S1/projeto-pochete/cenas/main.tscn", "res://microjogos/2023S1/projeto-RafaelCarro/cenas/main.tscn", "res://microjogos/2023S1/projetoAnaBeatriz/cenas/main.tscn", "res://microjogos/2023S1/projeto-pluvinage/cenas/main.tscn", "res://microjogos/2023S1/projeto_alexia/cenas/main.tscn", "res://microjogos/2023S1/projeto-gabriel-morais/cenas/main.tscn", "res://microjogos/2023S1/projeto-esteche/cenas/main.tscn", "res://microjogos/2023S1/projeto-viniwaki/cenas/main.tscn", "res://microjogos/2023S1/mail_cleaner/cenas/main.tscn", "res://microjogos/2023S1/projeto-matheuspavan/cenas/main.tscn"],
	"Class of 2022": ["res://microjogos/2022S1/baleia/cenas/baleiaGame.tscn", "res://microjogos/2022S1/gamuturai/cenas/main.tscn", "res://microjogos/2022S1/race/cenas/main.tscn"],
	"Demo": ["res://microjogos/demo/tiro_ao_alvo/cenas/main.tscn", "res://microjogos/demo/frogger/cenas/main.tscn"],
	"Godotware": ["res://microjogos/godotware/Bang/Main.tscn", "res://microjogos/godotware/Simon/Main.tscn"],
	"Moraguma": ["res://microjogos/moraguma/candle prick/cenas/Main.tscn", "res://microjogos/moraguma/deerskull/cenas/Main.tscn", "res://microjogos/moraguma/hora_da_necromancia/cenas/Main.tscn", "res://microjogos/moraguma/ifuv/cenas/Main.tscn", "res://microjogos/moraguma/soulchain/cenas/Main.tscn"]
}

# Removed from Moraguma
# "res://microjogos/moraguma/whale_eater/cenas/Main.tscn"

const filters = {
	"13+": ["res://microjogos/2022S1/baleia/cenas/baleiaGame.tscn", "res://microjogos/2023S1/projeto-thedeas/cenas/main.tscn"]
}

const minigame_data = {
	"gamutoware": {"credits": "res://principal/creditos.gd", "cover": "res://principal/recursos/sprites/capagmtware.png", "difficulty": 0},
	"res://microjogos/2023S1/projeto-enzo-bertoloti/cenas/main.tscn": {"credits": "res://microjogos/2023S1/projeto-enzo-bertoloti/creditos.gd", "cover": "res://microjogos/2023S1/projeto-enzo-bertoloti/capa.png", "difficulty": 0},
	"res://microjogos/2023S1/projeto-tiagoperrupato/cenas/main.tscn": {"credits": "res://microjogos/2023S1/projeto-tiagoperrupato/creditos.gd", "cover": "res://microjogos/2023S1/projeto-tiagoperrupato/capa.png", "difficulty": 0},
	"res://microjogos/2023S1/projeto-guglielmo-223300/cenas/main.tscn": {"credits": "res://microjogos/2023S1/projeto-guglielmo-223300/creditos.gd", "cover": "res://microjogos/2023S1/projeto-guglielmo-223300/capa.png", "difficulty": 0},
	"res://microjogos/2023S1/projeto_vinicius_carvalho/cenas/mapa.tscn": {"credits": "res://microjogos/2023S1/projeto_vinicius_carvalho/creditos.gd", "cover": "res://microjogos/2023S1/projeto_vinicius_carvalho/capa.png", "difficulty": 0},
	"res://microjogos/2023S1/bis-limao/cenas/main.tscn": {"credits": "res://microjogos/2023S1/bis-limao/creditos.gd", "cover": "res://microjogos/2023S1/bis-limao/capa.png", "difficulty": 0},
	"res://microjogos/2023S1/GamutoVeiga/cenas/main.tscn": {"credits": "res://microjogos/2023S1/GamutoVeiga/creditos.gd", "cover": "res://microjogos/2023S1/GamutoVeiga/capa.png", "difficulty": 0},
	"res://microjogos/2023S1/projeto-brabesf/cenas/main.tscn": {"credits": "res://microjogos/2023S1/projeto-brabesf/creditos.gd", "cover": "res://microjogos/2023S1/projeto-brabesf/capa.png", "difficulty": 0},
	"res://microjogos/2023S1/projeto-jose-victor/cenas/main.tscn": {"credits": "res://microjogos/2023S1/projeto-jose-victor/creditos.gd", "cover": "res://microjogos/2023S1/projeto-jose-victor/capa.png", "difficulty": 0},
	"res://microjogos/2023S1/projeto-thedeas/cenas/main.tscn": {"credits": "res://microjogos/2023S1/projeto-thedeas/creditos.gd", "cover": "res://microjogos/2023S1/projeto-thedeas/capa.png", "difficulty": 0},
	"res://microjogos/2023S1/projeto-yan-oliveira/cenas/main.tscn": {"credits": "res://microjogos/2023S1/projeto-yan-oliveira/creditos.gd", "cover": "res://microjogos/2023S1/projeto-yan-oliveira/capa.png", "difficulty": 0},
	"res://microjogos/2023S1/projeto_leonardo_valente/cenas/main.tscn": {"credits": "res://microjogos/2023S1/projeto_leonardo_valente/creditos.gd", "cover": "res://microjogos/2023S1/projeto_leonardo_valente/capa.png", "difficulty": 0},
	"res://microjogos/2023S1/projeto-pochete/cenas/main.tscn": {"credits": "res://microjogos/2023S1/projeto-pochete/creditos.gd", "cover": "res://microjogos/2023S1/projeto-pochete/capa.png", "difficulty": 0},
	"res://microjogos/2023S1/projeto-RafaelCarro/cenas/main.tscn": {"credits": "res://microjogos/2023S1/projeto-RafaelCarro/creditos.gd", "cover": "res://microjogos/2023S1/projeto-RafaelCarro/capa.png", "difficulty": 0},
	"res://microjogos/2023S1/projetoAnaBeatriz/cenas/main.tscn": {"credits": "res://microjogos/2023S1/projetoAnaBeatriz/creditos.gd", "cover": "res://microjogos/2023S1/projetoAnaBeatriz/capa.png", "difficulty": 0},
	"res://microjogos/2023S1/projeto-pluvinage/cenas/main.tscn": {"credits": "res://microjogos/2023S1/projeto-pluvinage/creditos.gd", "cover": "res://microjogos/2023S1/projeto-pluvinage/capa.png", "difficulty": 0},
	"res://microjogos/2023S1/projeto_alexia/cenas/main.tscn": {"credits": "res://microjogos/2023S1/projeto_alexia/creditos.gd", "cover": "res://microjogos/2023S1/projeto_alexia/capa.png", "difficulty": 0},
	"res://microjogos/2023S1/projeto-gabriel-morais/cenas/main.tscn": {"credits": "res://microjogos/2023S1/projeto-gabriel-morais/creditos.gd", "cover": "res://microjogos/2023S1/projeto-gabriel-morais/capa.png", "difficulty": 0},
	"res://microjogos/2023S1/projeto-esteche/cenas/main.tscn": {"credits": "res://microjogos/2023S1/projeto-esteche/creditos.gd", "cover": "res://microjogos/2023S1/projeto-esteche/capa.png", "difficulty": 0},
	"res://microjogos/2023S1/projeto-viniwaki/cenas/main.tscn": {"credits": "res://microjogos/2023S1/projeto-viniwaki/creditos.gd", "cover": "res://microjogos/2023S1/projeto-viniwaki/capa.jpg", "difficulty": 0},
	"res://microjogos/2023S1/mail_cleaner/cenas/main.tscn": {"credits": "res://microjogos/2023S1/mail_cleaner/creditos.gd", "cover": "res://microjogos/2023S1/mail_cleaner/capa.png", "difficulty": 0},
	"res://microjogos/2023S1/projeto-matheuspavan/cenas/main.tscn": {"credits": "res://microjogos/2023S1/projeto-matheuspavan/creditos.gd", "cover": "res://microjogos/2023S1/projeto-matheuspavan/capa.png", "difficulty": 0},
	"res://microjogos/2022S1/baleia/cenas/baleiaGame.tscn": {"credits": "res://microjogos/2022S1/baleia/creditos.gd", "cover": "res://microjogos/2022S1/baleia/capa.png", "difficulty": 0},
	"res://microjogos/2022S1/gamuturai/cenas/main.tscn": {"credits": "res://microjogos/2022S1/gamuturai/creditos.gd", "cover": "res://microjogos/2022S1/gamuturai/capa.png", "difficulty": 0},
	"res://microjogos/2022S1/race/cenas/main.tscn": {"credits": "res://microjogos/2022S1/race/creditos.gd", "cover": "res://microjogos/2022S1/race/capa.png", "difficulty": 0},
	"res://microjogos/demo/tiro_ao_alvo/cenas/main.tscn": {"credits": "res://microjogos/demo/tiro_ao_alvo/creditos.gd", "cover": "res://microjogos/demo/tiro_ao_alvo/capa.png", "difficulty": 0},
	"res://microjogos/demo/frogger/cenas/main.tscn": {"credits": "res://microjogos/demo/frogger/creditos.gd", "cover": "res://microjogos/demo/frogger/capa.png", "difficulty": 0},
	"res://microjogos/godotware/Bang/Main.tscn": {"credits": "res://microjogos/godotware/Bang/creditos.gd", "cover": "res://microjogos/godotware/Bang/capa.png", "difficulty": 0},
	"res://microjogos/godotware/Simon/Main.tscn": {"credits": "res://microjogos/godotware/Simon/creditos.gd", "cover": "res://microjogos/godotware/Simon/capa.png", "difficulty": 0},
	"res://microjogos/moraguma/candle prick/cenas/Main.tscn": {"credits": "res://microjogos/moraguma/candle prick/creditos.gd", "cover": "res://microjogos/moraguma/candle prick/capa.png", "difficulty": 0},
	"res://microjogos/moraguma/deerskull/cenas/Main.tscn": {"credits": "res://microjogos/moraguma/deerskull/creditos.gd", "cover": "res://microjogos/moraguma/deerskull/capa.png", "difficulty": 0},
	"res://microjogos/moraguma/hora_da_necromancia/cenas/Main.tscn": {"credits": "res://microjogos/moraguma/hora_da_necromancia/creditos.gd", "cover": "res://microjogos/moraguma/hora_da_necromancia/capa.png", "difficulty": 0},
	"res://microjogos/moraguma/ifuv/cenas/Main.tscn": {"credits": "res://microjogos/moraguma/ifuv/creditos.gd", "cover": "res://microjogos/moraguma/ifuv/capa.png", "difficulty": 0},
	"res://microjogos/moraguma/soulchain/cenas/Main.tscn": {"credits": "res://microjogos/moraguma/soulchain/creditos.gd", "cover": "res://microjogos/moraguma/soulchain/capa.png", "difficulty": 0},
	"res://microjogos/moraguma/whale_eater/cenas/Main.tscn": {"credits": "res://microjogos/moraguma/whale_eater/creditos.gd", "cover": "res://microjogos/moraguma/whale_eater/capa.png", "difficulty": 0}
}
