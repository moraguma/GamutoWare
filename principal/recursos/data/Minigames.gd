extends Resource


const minigame_packs = {
	"Moraguma": ["res://microjogos/moraguma/candle prick/cenas/Main.tscn", "res://microjogos/moraguma/deerskull/cenas/Main.tscn", "res://microjogos/moraguma/hora_da_necromancia/cenas/Main.tscn", "res://microjogos/moraguma/ifuv/cenas/Main.tscn", "res://microjogos/moraguma/soulchain/cenas/Main.tscn", "res://microjogos/moraguma/whale_eater/cenas/Main.tscn"],
	"Class of 2022": ["res://microjogos/2022S1/baleia/cenas/baleiaGame.tscn", "res://microjogos/2022S1/gamuturai/cenas/main.tscn", "res://microjogos/2022S1/race/cenas/main.tscn"],
	"Demo": ["res://microjogos/demo+/tiro_ao_alvo/cenas/main.tscn", "res://microjogos/demo+/frogger/cenas/main.tscn"]
}

const filters = {
	"13+": ["res://microjogos/2022S1/baleia/cenas/baleiaGame.tscn"]
}

const credit_paths = {
	"gamutoware": "res://principal/creditos.gd",
	"res://microjogos/moraguma/candle prick/cenas/Main.tscn": "res://microjogos/moraguma/candle prick/creditos.gd",
	"res://microjogos/moraguma/deerskull/cenas/Main.tscn": "res://microjogos/moraguma/deerskull/creditos.gd",
	"res://microjogos/moraguma/hora_da_necromancia/cenas/Main.tscn": "res://microjogos/moraguma/hora_da_necromancia/creditos.gd",
	"res://microjogos/moraguma/ifuv/cenas/Main.tscn": "res://microjogos/moraguma/ifuv/creditos.gd",
	"res://microjogos/moraguma/soulchain/cenas/Main.tscn": "res://microjogos/moraguma/soulchain/creditos.gd",
	"res://microjogos/moraguma/whale_eater/cenas/Main.tscn": "res://microjogos/moraguma/whale_eater/creditos.gd",
	"res://microjogos/2022S1/baleia/cenas/baleiaGame.tscn": "res://microjogos/2022S1/baleia/creditos.gd",
	"res://microjogos/2022S1/gamuturai/cenas/main.tscn": "res://microjogos/2022S1/gamuturai/creditos.gd",
	"res://microjogos/2022S1/race/cenas/main.tscn": "res://microjogos/2022S1/race/creditos.gd",
	"res://microjogos/demo+/tiro_ao_alvo/cenas/main.tscn": "res://microjogos/demo+/tiro_ao_alvo/creditos.gd",
	"res://microjogos/demo+/frogger/cenas/main.tscn": "res://microjogos/demo+/frogger/creditos.gd"
}

const cover_paths = {
	"gamutoware": "res://principal/recursos/sprites/capagmtware.png",
	"res://microjogos/moraguma/candle prick/cenas/Main.tscn": "res://microjogos/moraguma/candle prick/capa.png",
	"res://microjogos/moraguma/deerskull/cenas/Main.tscn": "res://microjogos/moraguma/deerskull/capa.png",
	"res://microjogos/moraguma/hora_da_necromancia/cenas/Main.tscn": "res://microjogos/moraguma/hora_da_necromancia/capa.png",
	"res://microjogos/moraguma/ifuv/cenas/Main.tscn": "res://microjogos/moraguma/ifuv/capa.png",
	"res://microjogos/moraguma/soulchain/cenas/Main.tscn": "res://microjogos/moraguma/soulchain/capa.png",
	"res://microjogos/moraguma/whale_eater/cenas/Main.tscn": "res://microjogos/moraguma/whale_eater/capa.png",
	"res://microjogos/2022S1/baleia/cenas/baleiaGame.tscn": "res://microjogos/2022S1/baleia/capa.png",
	"res://microjogos/2022S1/gamuturai/cenas/main.tscn": "res://microjogos/2022S1/gamuturai/capa.png",
	"res://microjogos/2022S1/race/cenas/main.tscn": "res://microjogos/2022S1/race/capa.png",
	"res://microjogos/demo+/tiro_ao_alvo/cenas/main.tscn": "res://microjogos/demo+/tiro_ao_alvo/capa.png",
	"res://microjogos/demo+/frogger/cenas/main.tscn": "res://microjogos/demo+/frogger/capa.png"
}
