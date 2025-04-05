extends Resource

const minigame_packs = {
	"class_of_2024" : "res://principal/recursos/data/packs/class_of_2024.tres",
	"class_of_2023" : "res://principal/recursos/data/packs/class_of_2023.tres",
	"class_of_2022" : "res://principal/recursos/data/packs/class_of_2022.tres",
	"demo" : "res://principal/recursos/data/packs/demo.tres",
	"godotware": "res://principal/recursos/data/packs/godotware.tres",
	"moraguma":  "res://principal/recursos/data/packs/moraguma.tres"
}

# Removed from Moraguma
# "res://microjogos/moraguma/whale_eater/cenas/Main.tscn"

const filters = {
	"no_gore": "res://principal/recursos/data/filters/no_gore.tres",
	"no_luck": "res://principal/recursos/data/filters/no_luck.tres"
}

const minigame_data = {
	"gamutoware": {"credits": "res://principal/creditos.gd", "cover": "res://principal/recursos/sprites/capagmtware.png", "difficulty": 0},
	"res://microjogos/2024S1/projeto-leticia/cenas/main.tscn": {"credits": "res://microjogos/2024S1/projeto-leticia/creditos.gd", "cover": "res://microjogos/2024S1/projeto-leticia/capa.png", "difficulty": 0},
	"res://microjogos/2024S1/projeto-samuel/cenas/main.tscn": {"credits": "res://microjogos/2024S1/projeto-samuel/creditos.gd", "cover": "res://microjogos/2024S1/projeto-samuel/capa.png", "difficulty": 0},
	"res://microjogos/2024S1/projeto-fakarasz/cenas/main.tscn": {"credits": "res://microjogos/2024S1/projeto-fakarasz/creditos.gd", "cover": "res://microjogos/2024S1/projeto-fakarasz/capa.png", "difficulty": 0},
  "res://microjogos/2024S1/projeto-jantinha/cenas/main.tscn": {"credits": "res://microjogos/2024S1/projeto-jantinha/creditos.gd", "cover": "res://microjogos/2024S1/projeto-jantinha/capa.png", "difficulty": 0},
  "res://microjogos/2024S1/projeto_felipe_onorio/cenas/main.tscn": {"credits": "res://microjogos/2024S1/projeto_felipe_onorio/creditos.gd", "cover": "res://microjogos/2024S1/projeto_felipe_onorio/capa.png", "difficulty": 0},
  "res://microjogos/2024S1/projeto-danielh/cenas/main.tscn": {"credits": "res://microjogos/2024S1/projeto-danielh/creditos.gd", "cover": "res://microjogos/2024S1/projeto-danielh/capa.png", "difficulty": 0},
	"res://microjogos/2024S1/projeto-guilherme/cenas/main.tscn": {"credits": "res://microjogos/2024S1/projeto-guilherme/creditos.gd", "cover": "res://microjogos/2024S1/projeto-guilherme/capa.png", "difficulty": 0},
  "res://microjogos/2024S1/gamufit/cenas/main.tscn": {"credits": "res://microjogos/2024S1/gamufit/creditos.gd", "cover": "res://microjogos/2024S1/gamufit/capa.png", "difficulty": 0},
	"res://microjogos/2024S1/lari-sem-cafe/cenas/main.tscn": {"credits": "res://microjogos/2024S1/lari-sem-cafe/creditos.gd", "cover": "res://microjogos/2024S1/lari-sem-cafe/capa.png", "difficulty": 0},
	"res://microjogos/2024S1/ShootGamuto/cenas/main.tscn": {"credits": "res://microjogos/2024S1/ShootGamuto/creditos.gd", "cover": "res://microjogos/2024S1/ShootGamuto/capa.png", "difficulty": 0},
	"res://microjogos/2024S1/Projeto-Yago/cenas/main.tscn": {"credits": "res://microjogos/2024S1/Projeto-Yago/creditos.gd", "cover": "res://microjogos/2024S1/Projeto-Yago/capa.png", "difficulty": 0},
	"res://microjogos/2024S1/projeto-do-FelipeG/cenas/main.tscn": {"credits": "res://microjogos/2024S1/projeto-do-FelipeG/creditos.gd", "cover": "res://microjogos/2024S1/projeto-do-FelipeG/capa.png", "difficulty": 0},
	"res://microjogos/2024S1/projeto-cores/cenas/main.tscn": {"credits": "res://microjogos/2024S1/projeto-cores/creditos.gd", "cover": "res://microjogos/2024S1/projeto-cores/capa.png", "difficulty": 0},
	"res://microjogos/2024S1/projeto-estrela/cenas/main.tscn": {"credits": "res://microjogos/2024S1/projeto-estrela/creditos.gd", "cover": "res://microjogos/2024S1/projeto-estrela/capa.png", "difficulty": 0},
	"res://microjogos/2024S1/projeto-felipe-silva/cenas/main.tscn": {"credits": "res://microjogos/2024S1/projeto-felipe-silva/creditos.gd", "cover": "res://microjogos/2024S1/projeto-felipe-silva/capa.png", "difficulty": 0},
	"res://microjogos/2024S1/nyan-thulu/cenas/main.tscn": {"credits": "res://microjogos/2024S1/nyan-thulu/creditos.gd", "cover": "res://microjogos/2024S1/nyan-thulu/capa.png", "difficulty": 0},
	"res://microjogos/2024S1/projeto-naomi/cenas/main.tscn": {"credits": "res://microjogos/2024S1/projeto-naomi/creditos.gd", "cover": "res://microjogos/2024S1/projeto-naomi/capa.png", "difficulty": 0},
	"res://microjogos/2024S1/projeto-matheusSC/cenas/main.tscn": {"credits": "res://microjogos/2024S1/projeto-matheusSC/creditos.gd", "cover": "res://microjogos/2024S1/projeto-matheusSC/capa.png", "difficulty": 0},
	"res://microjogos/2024S1/projeto-andre/cenas/main.tscn": {"credits": "res://microjogos/2024S1/projeto-andre/creditos.gd", "cover": "res://microjogos/2024S1/projeto-andre/capa.png", "difficulty": 0},
	"res://microjogos/2024S1/projeto-FastFood/cenas/main.tscn": {"credits": "res://microjogos/2024S1/projeto-FastFood/creditos.gd", "cover": "res://microjogos/2024S1/projeto-FastFood/capa.png", "difficulty": 0},
	"res://microjogos/2024S1/jucamm/cenas/main.tscn": {"credits": "res://microjogos/2024S1/jucamm/creditos.gd", "cover": "res://microjogos/2024S1/jucamm/capa.png", "difficulty": 0},
	"res://microjogos/2024S1/projeto-eco-g/cenas/main.tscn": {"credits": "res://microjogos/2024S1/projeto-eco-g/creditos.gd", "cover": "res://microjogos/2024S1/projeto-eco-g/capa.png", "difficulty": 0},
  "res://microjogos/2024S1/projeto-asteroids/cenas/main.tscn": {"credits": "res://microjogos/2024S1/projeto-asteroids/creditos.gd", "cover": "res://microjogos/2024S1/projeto-asteroids/capa.png", "difficulty": 0},
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
