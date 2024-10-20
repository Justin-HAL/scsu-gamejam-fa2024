extends Control

@onready var RecipieLabel = $"HomeBackground/MarginContainer/TextContainer/Recipie Info"
@onready var CraftingIcon = $HomeBackground/CraftingBox/NewPotionIcon
@onready var BrewButton = $HomeBackground/Buttons/CreatePotion
@onready var LeftButton = $HomeBackground/Buttons/CraftLeft
@onready var RightButton = $HomeBackground/Buttons/CraftRight
@onready var ExitButton = $Exit_Button
@onready var HomeMenu = $"."
@onready var OpenMenuButton = $"../TEST" # Replace with the actual button to open the Home UI
@onready var main_inv: inventory = preload("res://Inventory/player_inv.tres") # Main inventory
@onready var page = 1
@onready var CraftingGrid = $HomeBackground/MarginContainer/MarginContainer/GridContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ExitButton.pressed.connect(_on_exit_pressed)
	#OpenMenuButton.pressed.connect(open_menu_pressed)
	RightButton.pressed.connect(right_pressed)
	LeftButton.pressed.connect(left_pressed)
	BrewButton.pressed.connect(brew)
	updatepage()

func left_pressed() -> void:
	if page == 1:
		page = 4
	else:
		page -= 1
	updatepage()

func right_pressed() -> void:
	if page == 4:
		page = 1
	else:
		page += 1
	updatepage()

func updatepage() -> void:
	var ItemHolder1 = CraftingGrid.get_node("ItemHolder1")
	var ItemHolder2 = CraftingGrid.get_node("ItemHolder2")
	var ItemLabel1 = CraftingGrid.get_node("IngredientLabel1")
	var ItemLabel2 = CraftingGrid.get_node("IngredientLabel2")
	if page == 1:
		CraftingIcon.texture = load("res://sprites/new sprite/items/potion (blue).png")
		RecipieLabel.text = "This potion allows you to walk on water! Press Z to use this ability."
		ItemHolder1.texture = load("res://sprites/items/Cheese.png")
		ItemHolder2.texture = load("res://sprites/appear.png")
		ItemLabel1.text = "X 2"
		ItemLabel2.text = "X 3"
	elif page == 2:
		CraftingIcon.texture = load("res://sprites/new sprite/items/potion (green).png")
		RecipieLabel.text = "This is Dash potion! Press C to teleport in the direction you are facing."
		ItemHolder1.texture = load("res://sprites/new sprite/items/rose.png")
		ItemHolder2.texture = load("res://sprites/items/eyeball.png")
		ItemLabel1.text = "X 3"
		ItemLabel2.text = "X 3"
	elif page == 3:
		CraftingIcon.texture = load("res://sprites/new sprite/items/potion (purple).png")
		RecipieLabel.text = "This is the Transformation Potion! Press X to transform into a small mouse."
		ItemHolder1.texture = load("res://sprites/items/eyeball.png")
		ItemHolder2.texture = load("res://sprites/worm.png")
		ItemLabel1.text = "X 4"
		ItemLabel2.text = "X 4"
	elif page == 4:
		CraftingIcon.texture = load("res://sprites/new sprite/items/potion (white).png")
		RecipieLabel.text = "This is the Speed Potion! Press V to move quicker!"
		ItemHolder1.texture = load("res://sprites/items/carrot.png")
		ItemHolder2.texture = load("res://sprites/new sprite/items/Sunflower.png")
		ItemLabel1.text = "X 10"
		ItemLabel2.text = "X 10"

func increment_potion_count():
	if page == 1:
		Global.blue_count += 1
	elif page == 2:
		Global.green_count += 1
	elif page == 3:
		Global.purple_count += 1
	elif page == 4:
		Global.white_count += 1
	print_potion_counts()

func print_potion_counts():
	print("Blue Potions: ", Global.blue_count)
	print("Green Potions: ", Global.green_count)
	print("Purple Potions: ", Global.purple_count)
	print("White Potions: ", Global.white_count)

func brew() -> void:
	increment_potion_count()

func _on_exit_pressed() -> void:
	HomeMenu.visible = false

func open_menu_pressed() -> void:
	HomeMenu.visible = true
