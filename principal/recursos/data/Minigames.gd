extends Resource


const minigame_packs = {
	"Class of 2023": ["res://microjogos/2023S1/projeto-enzo-bertoloti/cenas/main.tscn", "res://microjogos/2023S1/projeto_vinicius_carvalho/cenas/mapa.tscn", "res://microjogos/2023S1/projeto-tiagoperrupato/cenas/main.tscn", "res://microjogos/2023S1/projeto-guglielmo-223300/cenas/main.tscn", "res://microjogos/2023S1/bis-limao/cenas/main.tscn", "res://microjogos/2023S1/GamutoVeiga/cenas/main.tscn", "res://microjogos/2023S1/projeto-brabesf/cenas/main.tscn", "res://microjogos/2023S1/projeto-jose-victor/cenas/main.tscn", "res://microjogos/2023S1/projeto-thedeas/cenas/main.tscn", "res://microjogos/2023S1/projeto-yan-oliveira/cenas/main.tscn", "res://microjogos/2023S1/projeto_leonardo_valente/cenas/main.tscn", "res://microjogos/2023S1/projeto-pochete/cenas/main.tscn", "res://microjogos/2023S1/projeto-RafaelCarro/cenas/main.tscn"],
	"Class of 2022": ["res://microjogos/2022S1/baleia/cenas/baleiaGame.tscn", "res://microjogos/2022S1/gamuturai/cenas/main.tscn", "res://microjogos/2022S1/race/cenas/main.tscn"],
	"Demo": ["res://microjogos/demo/tiro_ao_alvo/cenas/main.tscn", "res://microjogos/demo/frogger/cenas/main.tscn"],
	"Godotware": ["res://microjogos/godotware/Bang/Main.tscn", "res://microjogos/godotware/Simon/Main.tscn"],
	"Moraguma": ["res://microjogos/moraguma/candle prick/cenas/Main.tscn", "res://microjogos/moraguma/deerskull/cenas/Main.tscn", "res://microjogos/moraguma/hora_da_necromancia/cenas/Main.tscn", "res://microjogos/moraguma/ifuv/cenas/Main.tscn"],
	"isagabr": ["res://microjogos/2023S1/mail_cleaner/cenas/main.tscn"]
}

# Removed from Moraguma
# "res://microjogos/moraguma/soulchain/cenas/Main.tscn", "res://microjogos/moraguma/whale_eater/cenas/Main.tscn"

const filters = {
	"13+": ["res://microjogos/2022S1/baleia/cenas/baleiaGame.tscn", "res://microjogos/2023S1/projeto-thedeas/cenas/main.tscn"]
}

const credit_paths = {
	"gamutoware": "res://principal/creditos.gd",
	"res://microjogos/2023S1/projeto-enzo-bertoloti/cenas/main.tscn": "res://microjogos/2023S1/projeto-enzo-bertoloti/creditos.gd",
	"res://microjogos/2023S1/projeto-tiagoperrupato/cenas/main.tscn": "res://microjogos/2023S1/projeto-tiagoperrupato/creditos.gd",
	"res://microjogos/2023S1/projeto-guglielmo-223300/cenas/main.tscn": "res://microjogos/2023S1/projeto-guglielmo-223300/creditos.gd",
	"res://microjogos/2023S1/projeto_vinicius_carvalho/cenas/mapa.tscn": "res://microjogos/2023S1/projeto_vinicius_carvalho/creditos.gd",
	"res://microjogos/2023S1/bis-limao/cenas/main.tscn": "res://microjogos/2023S1/bis-limao/creditos.gd",
	"res://microjogos/2023S1/GamutoVeiga/cenas/main.tscn": "res://microjogos/2023S1/GamutoVeiga/creditos.gd",
	"res://microjogos/2023S1/projeto-brabesf/cenas/main.tscn": "res://microjogos/2023S1/projeto-brabesf/creditos.gd",
	"res://microjogos/2023S1/projeto-jose-victor/cenas/main.tscn": "res://microjogos/2023S1/projeto-jose-victor/creditos.gd",
	"res://microjogos/2023S1/projeto-thedeas/cenas/main.tscn": "res://microjogos/2023S1/projeto-thedeas/creditos.gd",
	"res://microjogos/2023S1/projeto-yan-oliveira/cenas/main.tscn": "res://microjogos/2023S1/projeto-yan-oliveira/creditos.gd",
	"res://microjogos/2023S1/projeto_leonardo_valente/cenas/main.tscn": "res://microjogos/2023S1/projeto_leonardo_valente/creditos.gd",
	"res://microjogos/2023S1/projeto-pochete/cenas/main.tscn": "res://microjogos/2023S1/projeto-pochete/creditos.gd",
	"res://microjogos/2023S1/projeto-RafaelCarro/cenas/main.tscn": "res://microjogos/2023S1/projeto-RafaelCarro/creditos.gd",
	"res://microjogos/2022S1/baleia/cenas/baleiaGame.tscn": "res://microjogos/2022S1/baleia/creditos.gd",
	"res://microjogos/2022S1/gamuturai/cenas/main.tscn": "res://microjogos/2022S1/gamuturai/creditos.gd",
	"res://microjogos/2022S1/race/cenas/main.tscn": "res://microjogos/2022S1/race/creditos.gd",
	"res://microjogos/demo/tiro_ao_alvo/cenas/main.tscn": "res://microjogos/demo/tiro_ao_alvo/creditos.gd",
	"res://microjogos/demo/frogger/cenas/main.tscn": "res://microjogos/demo/frogger/creditos.gd",
	"res://microjogos/godotware/Bang/Main.tscn": "res://microjogos/godotware/Bang/creditos.gd",
	"res://microjogos/godotware/Simon/Main.tscn": "res://microjogos/godotware/Simon/creditos.gd",
	"res://microjogos/moraguma/candle prick/cenas/Main.tscn": "res://microjogos/moraguma/candle prick/creditos.gd",
	"res://microjogos/moraguma/deerskull/cenas/Main.tscn": "res://microjogos/moraguma/deerskull/creditos.gd",
	"res://microjogos/moraguma/hora_da_necromancia/cenas/Main.tscn": "res://microjogos/moraguma/hora_da_necromancia/creditos.gd",
	"res://microjogos/moraguma/ifuv/cenas/Main.tscn": "res://microjogos/moraguma/ifuv/creditos.gd",
	"res://microjogos/moraguma/soulchain/cenas/Main.tscn": "res://microjogos/moraguma/soulchain/creditos.gd",
	"res://microjogos/moraguma/whale_eater/cenas/Main.tscn": "res://microjogos/moraguma/whale_eater/creditos.gd",
	"res://microjogos/2023S1/mail_cleaner/cenas/main.tscn": "res://microjogos/2023S1/mail_cleaner/creditos.gd"
}

const cover_paths = {
	"gamutoware": "res://principal/recursos/sprites/capagmtware.png",
	"res://microjogos/demo/tiro_ao_alvo/cenas/main.tscn": "res://microjogos/demo/tiro_ao_alvo/capa.png",
	"res://microjogos/demo/frogger/cenas/main.tscn": "res://microjogos/demo/frogger/capa.png",
	"res://microjogos/2022S1/baleia/cenas/baleiaGame.tscn": "res://microjogos/2022S1/baleia/capa.png",
	"res://microjogos/2022S1/gamuturai/cenas/main.tscn": "res://microjogos/2022S1/gamuturai/capa.png",
	"res://microjogos/2022S1/race/cenas/main.tscn": "res://microjogos/2022S1/race/capa.png",
	"res://microjogos/2023S1/projeto-enzo-bertoloti/cenas/main.tscn": "res://microjogos/2023S1/projeto-enzo-bertoloti/capa.png",
	"res://microjogos/2023S1/projeto-tiagoperrupato/cenas/main.tscn": "res://microjogos/2023S1/projeto-tiagoperrupato/capa.png",
	"res://microjogos/2023S1/projeto-guglielmo-223300/cenas/main.tscn": "res://microjogos/2023S1/projeto-guglielmo-223300/capa.png",
	"res://microjogos/2023S1/projeto_vinicius_carvalho/cenas/mapa.tscn": "res://microjogos/2023S1/projeto_vinicius_carvalho/capa.png",
	"res://microjogos/2023S1/bis-limao/cenas/main.tscn": "res://microjogos/2023S1/bis-limao/capa.png",
	"res://microjogos/2023S1/GamutoVeiga/cenas/main.tscn": "res://microjogos/2023S1/GamutoVeiga/capa.png",
	"res://microjogos/2023S1/projeto-brabesf/cenas/main.tscn": "res://microjogos/2023S1/projeto-brabesf/capa.png",
	"res://microjogos/2023S1/projeto-jose-victor/cenas/main.tscn": "res://microjogos/2023S1/projeto-jose-victor/capa.png",
	"res://microjogos/2023S1/projeto-thedeas/cenas/main.tscn": "res://microjogos/2023S1/projeto-thedeas/capa.png",
	"res://microjogos/2023S1/projeto-yan-oliveira/cenas/main.tscn": "res://microjogos/2023S1/projeto-yan-oliveira/capa.png",
	"res://microjogos/2023S1/projeto_leonardo_valente/cenas/main.tscn": "res://microjogos/2023S1/projeto_leonardo_valente/capa.png",
	"res://microjogos/2023S1/projeto-pochete/cenas/main.tscn": "res://microjogos/2023S1/projeto-pochete/capa.png",
	"res://microjogos/2023S1/projeto-RafaelCarro/cenas/main.tscn": "res://microjogos/2023S1/projeto-RafaelCarro/capa.png",
	"res://microjogos/godotware/Bang/Main.tscn": "res://microjogos/godotware/Bang/capa.png",
	"res://microjogos/godotware/Simon/Main.tscn": "res://microjogos/godotware/Simon/capa.png",
	"res://microjogos/moraguma/candle prick/cenas/Main.tscn": "res://microjogos/moraguma/candle prick/capa.png",
	"res://microjogos/moraguma/deerskull/cenas/Main.tscn": "res://microjogos/moraguma/deerskull/capa.png",
	"res://microjogos/moraguma/hora_da_necromancia/cenas/Main.tscn": "res://microjogos/moraguma/hora_da_necromancia/capa.png",
	"res://microjogos/moraguma/ifuv/cenas/Main.tscn": "res://microjogos/moraguma/ifuv/capa.png",
	"res://microjogos/moraguma/soulchain/cenas/Main.tscn": "res://microjogos/moraguma/soulchain/capa.png",
	"res://microjogos/moraguma/whale_eater/cenas/Main.tscn": "res://microjogos/moraguma/whale_eater/capa.png",
	"res://microjogos/2023S1/mail_cleaner/cenas/main.tscn": "res://microjogos/2023S1/mail_cleaner/capa.png"
}
