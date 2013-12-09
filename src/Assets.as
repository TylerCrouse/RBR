package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.utils.AssetManager;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets {
		
		private static var gameTextures:Dictionary = new Dictionary();
		private static var gameTextureAtlas:TextureAtlas;
		
		private static var sprites:Dictionary = new Dictionary();
		
		private static var tileTextures:Dictionary = new Dictionary();
		private static var tileTextureAtlas:TextureAtlas;
		
		[Embed(source="../Assets/temp.png")]
		public static const temp:Class;
		
		[Embed(source="../Assets/Backgrounds/Simple Backgrounds/mildBlueBG.png")]
		public static const mainMenuBG:Class;
		
		[Embed(source="../Assets/Backgrounds/Simple Backgrounds/pauseBG.png")]
		public static const pauseBG:Class;
		
		[Embed(source="../Assets/Backgrounds/Simple Backgrounds/creditsBG.png")]
		public static const creditsBG:Class;
		
		[Embed(source="../Assets/Sprites/bugSprite.png")]	
		public static const bugTexture:Class;
		
		[Embed(source="../Assets/Sprites/bugSprite.xml", mimeType = "application/octet-stream")]
		public static const bugXML:Class;
		
		[Embed(source="../Assets/Font Assets/Font Sheets/Font 1/Font 1.png")]
		//[Embed(source="../Assets/sprites.png")]
		public static const AtlasTextureGame:Class;
		
		[Embed(source="../Assets/Font Assets/Font Sheets/Font 1/Font 1.xml", mimeType="application/octet-stream")]
		//[Embed(source="../Assets/sprites.xml", mimeType="application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
		[Embed(source="../Assets/tiles/tileSprites.png")]
		public static const TileMapGame:Class;
		
		[Embed(source="../Assets/tiles/tileSprites.xml", mimeType="application/octet-stream")]
		public static const TileMapXmlGame:Class;
		
		public static function getTile():TextureAtlas {
			
			if (tileTextureAtlas == null)
			{
				var texture:Texture = getTexture("TileMapGame");
				var xml:XML = XML(new TileMapXmlGame());
				tileTextureAtlas = new TextureAtlas(texture, xml);
			}
			return tileTextureAtlas;
		}

		public static function getTileTextures(name:String):Texture {
			
			if (tileTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				tileTextures[name] = Texture.fromBitmap(bitmap);
			}
			return tileTextures[name];
		}
		
		//Functions and utilities provided by starling to make sprites easy
		public static function getAtlas():TextureAtlas {
			
			if (gameTextureAtlas == null)
			{
				var texture:Texture = getTexture("AtlasTextureGame");
				var xml:XML = XML(new AtlasXmlGame());
				gameTextureAtlas = new TextureAtlas(texture, xml);
			}
			return gameTextureAtlas;
		}

		public static function getTexture(name:String):Texture {
			
			if (gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
		
		public static function getSprite(name:String):TextureAtlas
		{
			if (sprites[name] == undefined)
			{
				var texture:Texture = Texture.fromBitmap(new Assets[name + "Texture"]());
				var xml:XML = XML(new Assets[name + "XML"]());
				sprites[name] = new TextureAtlas(texture, xml);
			}
			return sprites[name];
		}

	}
	
	
}