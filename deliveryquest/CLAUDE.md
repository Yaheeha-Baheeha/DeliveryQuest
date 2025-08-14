# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

DeliveryQuest is a Godot 4.4 game project built on the COGITO framework - a first-person immersive sim template. The project implements a weapon and item system with interactive NPCs and environments.

## Development Commands

Since this is a Godot project, development is primarily done through the Godot editor:

- **Run Game**: Open project in Godot editor and press F5 or click Play button
- **Open Editor**: Launch `project.godot` in Godot 4.4 stable
- **Main Scene**: `res://addons/cogito/DemoScenes/COGITO_0_MainMenu.tscn`

## Architecture Overview

### Core Framework
- **COGITO Framework**: Located in `addons/cogito/` - provides the core immersive sim functionality including player controller, interaction system, inventory, and scene management
- **Custom Game Logic**: Game-specific content in root `Scenes/`, `Resources/`, and `Audio/` directories

### Key Autoloads (project.godot:21-28)
- `CogitoGlobals`: Core framework globals and utilities
- `CogitoSceneManager`: Handles scene transitions and persistence 
- `CogitoQuestManager`: Quest system management
- `Audio`: Quick audio plugin for sound management
- `InputHelper`: Input mapping assistance

### Custom Weapon System
The project extends COGITO's wieldable system with custom weapons:

#### Wieldable Items (Scenes/Wieldables/)
- `wieldable_sword.gd`: Melee weapon with Area3D damage detection, stamina integration, and collision detection options
- `crossbow.gd`: Ranged weapon with projectile pooling system, ADS mechanics, and ammo management

#### Item Resources (Resources/)
- `.tres` files define weapon properties (damage, range, ammo, etc.)
- Follow COGITO's `WieldableItemPD` resource structure

### Game Content Structure
- `Scenes/Pickups/`: Item pickup prefabs for world placement
- `Scenes/Meshes/`: 3D models and textures
- `Scenes/enemies/`: NPC characters (barbarian, knight)
- `Audio/`: Game-specific sound effects

### COGITO Integration Points
- Wieldables extend `CogitoWieldable` base class
- Items use COGITO's inventory system (`InventoryItemPD`, `WieldableItemPD`)
- Player interactions handled through `PlayerInteractionComponent`
- Damage system uses signal-based communication (`damage_received`)

## Development Guidelines

### When Adding New Weapons
1. Create weapon script extending `CogitoWieldable` in `Scenes/Wieldables/`
2. Create corresponding `.tres` resource in `Resources/` using `WieldableItemPD`
3. Set up pickup prefab in `Scenes/Pickups/`
4. Configure weapon properties: damage, range, animations, audio

### When Modifying NPCs/Enemies
- Enemy scenes in `Scenes/enemies/` use COGITO's NPC system
- Characters use KayKit adventure pack assets with custom animations

### Audio Integration
- Uses Quick Audio plugin for streamlined audio management
- Weapon sounds configured per-wieldable in export groups

## Physics Configuration
- Uses Jolt Physics engine (project.godot:223)
- Layer 1: Environment
- Layer 2: Interactables