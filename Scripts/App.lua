local xrot = 0
local yrot = 0

local text = 200

local sub = 2

local curAct = 1 local nnvirt = 17

local XHERO = 924  local YHERO = 886
local xmov = 0 local ymov = 0 local zmov = 0
local xrot1 = 0 local yrot1 = 0 local zrot1 = 0

minnFrameVirt = {}
maxxFrameVirt = {}
actNameVirt = {}
models = {} 

local f = io.open("data.txt","w")
flag = 1
--This function will be called once when the program starts
function App:Start()		
	
	--Create a window
	self.window=Window:Create("Virt",  0,0, 1024,768 )
	--self.window:HideMouse()
	
	--Create the graphics context
	self.context=Context:Create(self.window,0)
	if self.context==nil then return false end
--asasdas
	--Create a world
	self.world=World:Create()
	
	--Load a font
        self.font = Font:Load("Materials/Fonts/arial.ttf", 20)
        self.context:SetFont(self.font)	
	
	--Load a map
	local mapfile = System:GetProperty("map","Maps/start.map") --Ata
	if Map:Load(mapfile)==false then return false end
	
	--Create a camera
	self.camera = Camera:Create()
	
	
	self.camera:Move(0, 2, -8)

	xrot = 90;
	yrot = 10;
	zrot = 0;	
	
	virtxpos = {}
	virtypos = {}
	virtzpos = {}
	virtwquat = {}
	virtxquat = {}
	virtyquat = {}
	virtzquat = {}
	for i = 1,20 do
		virtxpos[i] = {}
		virtypos[i] = {}
		virtzpos[i] = {}
		virtwquat[i] = {}
		virtxquat[i] = {}
		virtyquat[i] = {}
		virtzquat[i] = {}
	end

	models[20] = Model:Box(0,0,0)
	models[1] = Model:Box(0,0,0)

	for x=0,App.world:CountEntities()-1 do
		local model = App.world:GetEntity(x)
                if(model:GetKeyValue("name") == "vMesh_001_root") then
                        models[19] = model
			models[19]:SetPosition(0, 0, 0)
                end
                if(model:GetKeyValue("name") == "vMesh_002_root") then
                        models[18] = model
			models[18]:SetPosition(0, 0, 0)
                end
                if(model:GetKeyValue("name") == "vMesh_003_root") then
                        models[17] = model
			models[17]:SetPosition(0, 0, 0)
                end
                if(model:GetKeyValue("name") == "vMesh_004_root") then
                        models[16] = model
			models[16]:SetPosition(0, 0, 0)
                end
                if(model:GetKeyValue("name") == "vMesh_005_root") then
                        models[15] = model
			models[15]:SetPosition(0, 0, 0)
                end
                if(model:GetKeyValue("name") == "vMesh_006_root") then
                        models[14] = model
			models[14]:SetPosition(0, 0, 0)
                end
                if(model:GetKeyValue("name") == "vMesh_007_root") then
                        models[13] = model
			models[13]:SetPosition(0, 0, 0)
                end
                if(model:GetKeyValue("name") == "vMesh_008_root") then
                        models[12] = model
			models[12]:SetPosition(0, 0, 0)
                end
                if(model:GetKeyValue("name") == "vMesh_009_root") then
                        models[11] = model
			models[11]:SetPosition(0, 0, 0)
                end
                if(model:GetKeyValue("name") == "vMesh_010_root") then
                        models[10] = model
			models[10]:SetPosition(0, 0, 0)
                end
                if(model:GetKeyValue("name") == "vMesh_011_root") then
                        models[9] = model
			models[9]:SetPosition(0, 0, 0)
                end
                if(model:GetKeyValue("name") == "vMesh_012_root") then
                        models[8] = model
			models[8]:SetPosition(0, 0, 0)
                end
                if(model:GetKeyValue("name") == "vMesh_013_root") then
                        models[7] = model
			models[7]:SetPosition(0, 0, 0)
                end
                if(model:GetKeyValue("name") == "vMesh_014_root") then
                        models[6] = model
			models[6]:SetPosition(0, 0, 0)
                end
                if(model:GetKeyValue("name") == "vMesh_015_root") then
                        models[5] = model
			models[5]:SetPosition(0, 0, 0)
                end
                if(model:GetKeyValue("name") == "vMesh_016_root") then
                        models[4] = model
			models[4]:SetPosition(0, 0, 0)
                end
                if(model:GetKeyValue("name") == "vMesh_017_root") then
                        models[3] = model
			models[3]:SetPosition(0, 0, 0)
                end
                if(model:GetKeyValue("name") == "vMesh_018_root") then
                        models[2] = model
			models[2]:SetPosition(0, 0, 0)
                end
        end
	App:InitAnimationVirt()
	App:InitAnimSummaryVirt()		
	

	curAct = 1;

	xmov = XHERO;
	ymov = 505;
	zmov = YHERO;

	yrot = 150;
	
	
	return true
end

--This is our main program loop and will be called continuously until the program ends
function App:Loop()
	
	--If window has been closed, end the program
	if self.window:Closed() or self.window:KeyDown(Key.Escape) then
		f:close()
		return false 
	end

	for i = minnFrameVirt[7],maxxFrameVirt[7] do -- 3 32
		
		flag = 1

		self.camera:SetPosition(xmov-yrot*math.cos(math.pi *xrot/180),ymov + 40, zmov - yrot * math.sin(math.pi *xrot/180)) --Ata
		self.camera:Point(models[9],2,1)	
		
		CameraX = self.camera:GetPosition()[0] 
		CameraY = self.camera:GetPosition()[1] 
		CameraZ = self.camera:GetPosition()[2]
		string.format("%f", i)
		line = "xrot="..string.format("%f", xrot).."; yrot="..string.format("%f", yrot).."; ymov="..string.format("%f", ymov).."\n".."xcam="..string.format("%f", CameraX).."; ycam="..string.format("%f", CameraY).."; zcam="..string.format("%f", CameraZ)

		
			
		CurFrame = i

		if (self.window:KeyHit(Key.Up))  then 
			yrot=yrot-3
		end

		if (self.window:KeyHit(Key.Down)) then 
			yrot=yrot+3
		end

		if (self.window:KeyHit(Key.Left)) then 
			xrot=xrot-3
		end

		if (self.window:KeyHit(Key.Right)) then 
			xrot=xrot+3
		end

		if (self.window:KeyHit(Key.Z)) then 
			ymov=ymov-1		
		end

		if (self.window:KeyHit(Key.X)) then 
			ymov=ymov+1		
		end

		-- rotate model
		if (self.window:KeyHit(Key.Z)) then 
			yrot1=yrot1-1
		end

		if (self.window:KeyHit(Key.X)) then 
			yrot1=yrot1+1	
		end
		
		
		App:VirtAnimation1();
			

		--Update the app timing
		Time:Update()
		
		--Update the world
		self.world:Update()
		
		--Render the world
		self.world:Render()	

		--Эта команда должна обязательно быть перед вызовом LoaderGUI
		--Без неё текст будет отображаться неправильно
		self.context:SetBlendMode(Blend.Alpha)
		App:LoaderGUI()
		

		self.context:DrawText(line, 0, 0)
		--Refresh the screen
		self.context:Sync(true)

		while flag>0 do
			if self.window:KeyHit(Key.Space) then
				flag = 0
			end
			if self.window:Closed() or self.window:KeyHit(Key.Escape) then
				f:close()
				return false 
			end
		end		
	end
	
	
	--Returning true tells the main program to keep looping
	return true
end

function App:LoaderGUI()
	
	self.context:DrawText("RCamL", 50,200)
	self.context:DrawText("RCamR", self.window:GetWidth()-250, 200)
	
	self.context:DrawText("ZoomOut", 50,450)
	self.context:DrawText("ZoomIn", self.window:GetWidth()-300, 450)
	
	self.context:DrawText(actNameVirt[curAct], 100, self.window:GetHeight()-100)
	
	-- Interaction
	-- change act animation
	if ( self.window:MouseX()>0 and 
		self.window:MouseX()<310 and 
		self.window:MouseY()>self.window:GetHeight()-100 and 
		self.window:MouseDown(1))
	then
		Time:Delay(200)
		curAct=curAct+1
		if curAct>nnvirt then curAct=1 end
	end

	-- rotate camera left
	if (self.window:MouseX()>0 and 
		self.window:MouseX()<210 and 
		self.window:MouseY()>190 and 
		self.window:MouseY()<250 and 
		self.window:MouseDown(1))
	then
		xrot=xrot-3
	end
	
	-- rotate camera right
	if (self.window:MouseX()>750 and 
		self.window:MouseX()<1024 and 
		self.window:MouseY()>190 and 
		self.window:MouseY()<250 and 
		self.window:MouseDown(1))
	then
		xrot=xrot+3
	end
	
	-- zoom in camera
	if (self.window:MouseX()>0 and 
		self.window:MouseX()<270 and
		self.window:MouseY()>440 and 
		self.window:MouseY()<500 and 
		self.window:MouseDown(1))
	then
		yrot = yrot+0.3
	end

	-- zoom out camera
	if (self.window:MouseX()>710 and 
		self.window:MouseX()<1024 and 
		self.window:MouseY()>440 and 
		self.window:MouseY()<500 and 
		self.window:MouseDown(1))
	then
		yrot = yrot-0.3
	end
end

function App:InitAnimationVirt()	
        local path = "media/animvirtdata.dat" 
        local stream = FileSystem:OpenFile(path) 
	local framn = 2
        while(framn <= 1166) do
		for limbn=1,20 do 
			virtxpos[limbn][framn] = tonumber(stream:ReadLine()) * 0.001
			virtypos[limbn][framn] = tonumber(stream:ReadLine()) * 0.001
			virtzpos[limbn][framn] = tonumber(stream:ReadLine()) * 0.001
			virtwquat[limbn][framn] = tonumber(stream:ReadLine()) * 0.001
			virtxquat[limbn][framn] = tonumber(stream:ReadLine()) * 0.001
			virtyquat[limbn][framn] = tonumber(stream:ReadLine()) * 0.001
			virtzquat[limbn][framn] = tonumber(stream:ReadLine()) * 0.001
		end
		framn = framn + 1
        end
	stream:Release()
end

function App:VirtAnimation1()
		------vMesh_018
		qw = virtwquat[2][CurFrame]
		qx = virtxquat[2][CurFrame]
		qy = virtyquat[2][CurFrame]
		qz = virtzquat[2][CurFrame]
		lpxx = virtxpos[2][CurFrame]
		lpyy = virtypos[2][CurFrame]
		lpzz = virtzpos[2][CurFrame]
		setScale = 15
		--f:write( string.format("%i", CurFrame).."\n")
		--f:write( string.format("%f", -models[2]:GetQuaternion()[3]).."\n")
		--f:write( string.format("%f", models[2]:GetQuaternion()[2]).."\n")
		--f:write( string.format("%f", models[2]:GetQuaternion()[1]).."\n")
		--f:write( string.format("%f", models[2]:GetQuaternion()[0]).."\n")
		--f:write( models[2]:GetQuaternion():ToString().."\n") 
		local quat = Quat(qx, qy, qz, -qw)
		models[2]:SetQuaternion(quat, true)
		--f:write( string.format("%i", 2).."\n")
		--f:write( quat:ToString().."\n")
		--f:write( models[2]:GetQuaternion():ToString().."\n")		
		diagg = math.sqrt(lpxx*lpxx + lpzz*lpzz)
		--f:write( string.format("%f", diagg).."\n")
		angg = App:acos1(lpxx, 0.0, lpzz, 0.0)
		--f:write( string.format("%f", angg).."\n")
		--f:write( string.format("%f", models[2]:GetPosition()[0]).."\n")
		--f:write( string.format("%f", models[2]:GetPosition()[1]).."\n")
		--f:write( string.format("%f", models[2]:GetPosition()[2]).."\n")	
		models[2]:SetPosition(setScale*diagg*math.sin(math.pi *(angg+yrot1)/180.0)+xmov, setScale*lpyy+ymov, setScale*diagg*math.cos(math.pi * (angg+yrot1)/180.0)+zmov)
		--f:write( string.format("%f", models[2]:GetPosition()[0]).."\n")
		--f:write( string.format("%f", models[2]:GetPosition()[1]).."\n")
		--f:write( string.format("%f", models[2]:GetPosition()[2]).."\n")	
		--f:write( models[limbnn]:GetPosition():ToString().."\n")
		xrott = models[2]:GetRotation()[0] + xrot1
		--f:write( string.format("%f", xrott).."\n")
		yrott = models[2]:GetRotation()[1] + yrot1
		--f:write( string.format("%f", yrott).."\n")
		zrott = models[2]:GetRotation()[2] + zrot1
		--f:write( string.format("%f", zrott).."\n")
		models[2]:SetRotation(xrott, yrott, zrott)		
		models[2]:SetScale(setScale, setScale, setScale)		

		------vMesh_017
		qw = virtwquat[3][CurFrame]
		qx = virtxquat[3][CurFrame]
		qy = virtyquat[3][CurFrame]
		qz = virtzquat[3][CurFrame]
		lpxx = virtxpos[3][CurFrame]
		lpyy = virtypos[3][CurFrame]
		lpzz = virtzpos[3][CurFrame]
		setScale = 15
		local quat = Quat(qx, qy, qz, -qw)
		models[3]:SetQuaternion(quat, true)
		diagg = math.sqrt(lpxx*lpxx + lpzz*lpzz)
		angg = App:acos1(lpxx, 0.0, lpzz, 0.0)
		models[3]:SetPosition(setScale*diagg*math.sin(math.pi *(angg+yrot1)/180.0)+xmov, setScale*lpyy+ymov, setScale*diagg*math.cos(math.pi * (angg+yrot1)/180.0)+zmov)
		xrott = models[3]:GetRotation()[0] + xrot1
		yrott = models[3]:GetRotation()[1] + yrot1
		zrott = models[3]:GetRotation()[2] + zrot1
		models[3]:SetRotation(xrott, yrott, zrott)
		models[3]:SetScale(setScale, setScale, setScale)

		------vMesh_016
		qw = virtwquat[4][CurFrame]
		qx = virtxquat[4][CurFrame]
		qy = virtyquat[4][CurFrame]
		qz = virtzquat[4][CurFrame]
		lpxx = virtxpos[4][CurFrame]
		lpyy = virtypos[4][CurFrame]
		lpzz = virtzpos[4][CurFrame]
		setScale = 15
		local quat = Quat(qx, qy, qz, -qw)
		models[4]:SetQuaternion(quat, true)
		diagg = math.sqrt(lpxx*lpxx + lpzz*lpzz)
		angg = App:acos1(lpxx, 0.0, lpzz, 0.0)
		models[4]:SetPosition(setScale*diagg*math.sin(math.pi *(angg+yrot1)/180.0)+xmov, setScale*lpyy+ymov, setScale*diagg*math.cos(math.pi * (angg+yrot1)/180.0)+zmov)
		xrott = models[4]:GetRotation()[0] + xrot1
		yrott = models[4]:GetRotation()[1] + yrot1
		zrott = models[4]:GetRotation()[2] + zrot1
		models[4]:SetRotation(xrott, yrott, zrott)
		models[4]:SetScale(setScale, setScale, setScale)

		------vMesh_015
		qw = virtwquat[5][CurFrame]
		qx = virtxquat[5][CurFrame]
		qy = virtyquat[5][CurFrame]
		qz = virtzquat[5][CurFrame]
		lpxx = virtxpos[5][CurFrame]
		lpyy = virtypos[5][CurFrame]
		lpzz = virtzpos[5][CurFrame]
		setScale = 15
		local quat = Quat(qx, qy, qz, -qw)
		models[5]:SetQuaternion(quat, true)
		diagg = math.sqrt(lpxx*lpxx + lpzz*lpzz)
		angg = App:acos1(lpxx, 0.0, lpzz, 0.0)
		models[5]:SetPosition(setScale*diagg*math.sin(math.pi *(angg+yrot1)/180.0)+xmov, setScale*lpyy+ymov, setScale*diagg*math.cos(math.pi * (angg+yrot1)/180.0)+zmov)
		xrott = models[5]:GetRotation()[0] + xrot1
		yrott = models[5]:GetRotation()[1] + yrot1
		zrott = models[5]:GetRotation()[2] + zrot1
		models[5]:SetRotation(xrott, yrott, zrott)
		models[5]:SetScale(setScale, setScale, setScale)

		------vMesh_014
		qw = virtwquat[6][CurFrame]
		qx = virtxquat[6][CurFrame]
		qy = virtyquat[6][CurFrame]
		qz = virtzquat[6][CurFrame]
		lpxx = virtxpos[6][CurFrame]
		lpyy = virtypos[6][CurFrame]
		lpzz = virtzpos[6][CurFrame]
		setScale = 15
		local quat = Quat(qx, qy, qz, -qw)
		models[6]:SetQuaternion(quat, true)
		diagg = math.sqrt(lpxx*lpxx + lpzz*lpzz)
		angg = App:acos1(lpxx, 0.0, lpzz, 0.0)
		models[6]:SetPosition(setScale*diagg*math.sin(math.pi *(angg+yrot1)/180.0)+xmov, setScale*lpyy+ymov, setScale*diagg*math.cos(math.pi * (angg+yrot1)/180.0)+zmov)
		xrott = models[6]:GetRotation()[0] + xrot1
		yrott = models[6]:GetRotation()[1] + yrot1
		zrott = models[6]:GetRotation()[2] + zrot1
		models[6]:SetRotation(xrott, yrott, zrott)
		models[6]:SetScale(setScale, setScale, setScale)

		------vMesh_013
		qw = virtwquat[7][CurFrame]
		qx = virtxquat[7][CurFrame]
		qy = virtyquat[7][CurFrame]
		qz = virtzquat[7][CurFrame]
		lpxx = virtxpos[7][CurFrame]
		lpyy = virtypos[7][CurFrame]
		lpzz = virtzpos[7][CurFrame]
		setScale = 15
		local quat = Quat(qx, qy, qz, -qw)
		models[7]:SetQuaternion(quat, true)
		diagg = math.sqrt(lpxx*lpxx + lpzz*lpzz)
		angg = App:acos1(lpxx, 0.0, lpzz, 0.0)
		models[7]:SetPosition(setScale*diagg*math.sin(math.pi *(angg+yrot1)/180.0)+xmov, setScale*lpyy+ymov, setScale*diagg*math.cos(math.pi * (angg+yrot1)/180.0)+zmov)
		xrott = models[7]:GetRotation()[0] + xrot1
		yrott = models[7]:GetRotation()[1] + yrot1
		zrott = models[7]:GetRotation()[2] + zrot1
		models[7]:SetRotation(xrott, yrott, zrott)
		models[7]:SetScale(setScale, setScale, setScale)

		------vMesh_012
		qw = virtwquat[8][CurFrame]
		qx = virtxquat[8][CurFrame]
		qy = virtyquat[8][CurFrame]
		qz = virtzquat[8][CurFrame]
		lpxx = virtxpos[8][CurFrame]
		lpyy = virtypos[8][CurFrame]
		lpzz = virtzpos[8][CurFrame]
		setScale = 15
		local quat = Quat(qx, qy, qz, -qw)
		models[8]:SetQuaternion(quat, true)
		diagg = math.sqrt(lpxx*lpxx + lpzz*lpzz)
		angg = App:acos1(lpxx, 0.0, lpzz, 0.0)
		models[8]:SetPosition(setScale*diagg*math.sin(math.pi *(angg+yrot1)/180.0)+xmov, setScale*lpyy+ymov, setScale*diagg*math.cos(math.pi * (angg+yrot1)/180.0)+zmov)
		xrott = models[8]:GetRotation()[0] + xrot1
		yrott = models[8]:GetRotation()[1] + yrot1
		zrott = models[8]:GetRotation()[2] + zrot1
		models[8]:SetRotation(xrott, yrott, zrott)
		models[8]:SetScale(setScale, setScale, setScale)

		------vMesh_011
		qw = virtwquat[9][CurFrame]
		qx = virtxquat[9][CurFrame]
		qy = virtyquat[9][CurFrame]
		qz = virtzquat[9][CurFrame]
		lpxx = virtxpos[9][CurFrame]
		lpyy = virtypos[9][CurFrame]
		lpzz = virtzpos[9][CurFrame]
		setScale = 15
		local quat = Quat(qx, qy, qz, -qw)
		models[9]:SetQuaternion(quat, true)
		diagg = math.sqrt(lpxx*lpxx + lpzz*lpzz)
		angg = App:acos1(lpxx, 0.0, lpzz, 0.0)
		models[9]:SetPosition(setScale*diagg*math.sin(math.pi *(angg+yrot1)/180.0)+xmov, setScale*lpyy+ymov, setScale*diagg*math.cos(math.pi * (angg+yrot1)/180.0)+zmov)
		xrott = models[9]:GetRotation()[0] + xrot1
		yrott = models[9]:GetRotation()[1] + yrot1
		zrott = models[9]:GetRotation()[2] + zrot1
		models[9]:SetRotation(xrott, yrott, zrott)
		models[9]:SetScale(setScale, setScale, setScale)

		------vMesh_010
		qw = virtwquat[10][CurFrame]
		qx = virtxquat[10][CurFrame]
		qy = virtyquat[10][CurFrame]
		qz = virtzquat[10][CurFrame]
		lpxx = virtxpos[10][CurFrame]
		lpyy = virtypos[10][CurFrame]
		lpzz = virtzpos[10][CurFrame]
		setScale = 15
		local quat = Quat(qx, qy, qz, -qw)
		models[10]:SetQuaternion(quat, true)
		diagg = math.sqrt(lpxx*lpxx + lpzz*lpzz)
		angg = App:acos1(lpxx, 0.0, lpzz, 0.0)
		models[10]:SetPosition(setScale*diagg*math.sin(math.pi *(angg+yrot1)/180.0)+xmov, setScale*lpyy+ymov, setScale*diagg*math.cos(math.pi * (angg+yrot1)/180.0)+zmov)
		xrott = models[10]:GetRotation()[0] + xrot1
		yrott = models[10]:GetRotation()[1] + yrot1
		zrott = models[10]:GetRotation()[2] + zrot1
		models[10]:SetRotation(xrott, yrott, zrott)
		models[10]:SetScale(setScale, setScale, setScale)

		------vMesh_009
		qw = virtwquat[11][CurFrame]
		qx = virtxquat[11][CurFrame]
		qy = virtyquat[11][CurFrame]
		qz = virtzquat[11][CurFrame]
		lpxx = virtxpos[11][CurFrame]
		lpyy = virtypos[11][CurFrame]
		lpzz = virtzpos[11][CurFrame]
		setScale = 15
		local quat = Quat(qx, qy, qz, -qw)
		models[11]:SetQuaternion(quat, true)
		diagg = math.sqrt(lpxx*lpxx + lpzz*lpzz)
		angg = App:acos1(lpxx, 0.0, lpzz, 0.0)
		models[11]:SetPosition(setScale*diagg*math.sin(math.pi *(angg+yrot1)/180.0)+xmov, setScale*lpyy+ymov, setScale*diagg*math.cos(math.pi * (angg+yrot1)/180.0)+zmov)
		xrott = models[11]:GetRotation()[0] + xrot1
		yrott = models[11]:GetRotation()[1] + yrot1
		zrott = models[11]:GetRotation()[2] + zrot1
		models[11]:SetRotation(xrott, yrott, zrott)
		models[11]:SetScale(setScale, setScale, setScale)

		------vMesh_008
		qw = virtwquat[12][CurFrame]
		qx = virtxquat[12][CurFrame]
		qy = virtyquat[12][CurFrame]
		qz = virtzquat[12][CurFrame]
		lpxx = virtxpos[12][CurFrame]
		lpyy = virtypos[12][CurFrame]
		lpzz = virtzpos[12][CurFrame]
		setScale = 15
		local quat = Quat(qx, qy, qz, -qw)
		models[12]:SetQuaternion(quat, true)
		diagg = math.sqrt(lpxx*lpxx + lpzz*lpzz)
		angg = App:acos1(lpxx, 0.0, lpzz, 0.0)
		models[12]:SetPosition(setScale*diagg*math.sin(math.pi *(angg+yrot1)/180.0)+xmov, setScale*lpyy+ymov, setScale*diagg*math.cos(math.pi * (angg+yrot1)/180.0)+zmov)
		xrott = models[12]:GetRotation()[0] + xrot1
		yrott = models[12]:GetRotation()[1] + yrot1
		zrott = models[12]:GetRotation()[2] + zrot1
		models[12]:SetRotation(xrott, yrott, zrott)
		models[12]:SetScale(setScale, setScale, setScale)

		------vMesh_007
		qw = virtwquat[13][CurFrame]
		qx = virtxquat[13][CurFrame]
		qy = virtyquat[13][CurFrame]
		qz = virtzquat[13][CurFrame]
		lpxx = virtxpos[13][CurFrame]
		lpyy = virtypos[13][CurFrame]
		lpzz = virtzpos[13][CurFrame]
		setScale = 15
		local quat = Quat(qx, qy, qz, -qw)
		models[13]:SetQuaternion(quat, true)
		diagg = math.sqrt(lpxx*lpxx + lpzz*lpzz)
		angg = App:acos1(lpxx, 0.0, lpzz, 0.0)
		models[13]:SetPosition(setScale*diagg*math.sin(math.pi *(angg+yrot1)/180.0)+xmov, setScale*lpyy+ymov, setScale*diagg*math.cos(math.pi * (angg+yrot1)/180.0)+zmov)
		xrott = models[13]:GetRotation()[0] + xrot1
		yrott = models[13]:GetRotation()[1] + yrot1
		zrott = models[13]:GetRotation()[2] + zrot1
		models[13]:SetRotation(xrott, yrott, zrott)
		models[13]:SetScale(setScale, setScale, setScale)

		------vMesh_006
		qw = virtwquat[14][CurFrame]
		qx = virtxquat[14][CurFrame]
		qy = virtyquat[14][CurFrame]
		qz = virtzquat[14][CurFrame]
		lpxx = virtxpos[14][CurFrame]
		lpyy = virtypos[14][CurFrame]
		lpzz = virtzpos[14][CurFrame]
		setScale = 15
		local quat = Quat(qx, qy, qz, -qw)
		models[14]:SetQuaternion(quat, true)
		diagg = math.sqrt(lpxx*lpxx + lpzz*lpzz)
		angg = App:acos1(lpxx, 0.0, lpzz, 0.0)
		models[14]:SetPosition(setScale*diagg*math.sin(math.pi *(angg+yrot1)/180.0)+xmov, setScale*lpyy+ymov, setScale*diagg*math.cos(math.pi * (angg+yrot1)/180.0)+zmov)
		xrott = models[14]:GetRotation()[0] + xrot1
		yrott = models[14]:GetRotation()[1] + yrot1
		zrott = models[14]:GetRotation()[2] + zrot1
		models[14]:SetRotation(xrott, yrott, zrott)
		models[14]:SetScale(setScale, setScale, setScale)

		------vMesh_005
		qw = virtwquat[15][CurFrame]
		qx = virtxquat[15][CurFrame]
		qy = virtyquat[15][CurFrame]
		qz = virtzquat[15][CurFrame]
		lpxx = virtxpos[15][CurFrame]
		lpyy = virtypos[15][CurFrame]
		lpzz = virtzpos[15][CurFrame]
		setScale = 15
		local quat = Quat(qx, qy, qz, -qw)
		models[15]:SetQuaternion(quat, true)
		diagg = math.sqrt(lpxx*lpxx + lpzz*lpzz)
		angg = App:acos1(lpxx, 0.0, lpzz, 0.0)
		models[15]:SetPosition(setScale*diagg*math.sin(math.pi *(angg+yrot1)/180.0)+xmov, setScale*lpyy+ymov, setScale*diagg*math.cos(math.pi * (angg+yrot1)/180.0)+zmov)
		xrott = models[15]:GetRotation()[0] + xrot1
		yrott = models[15]:GetRotation()[1] + yrot1
		zrott = models[15]:GetRotation()[2] + zrot1
		models[15]:SetRotation(xrott, yrott, zrott)
		models[15]:SetScale(setScale, setScale, setScale)

		------vMesh_004
		qw = virtwquat[16][CurFrame]
		qx = virtxquat[16][CurFrame]
		qy = virtyquat[16][CurFrame]
		qz = virtzquat[16][CurFrame]
		lpxx = virtxpos[16][CurFrame]
		lpyy = virtypos[16][CurFrame]
		lpzz = virtzpos[16][CurFrame]
		setScale = 15
		local quat = Quat(qx, qy, qz, -qw)
		models[16]:SetQuaternion(quat, true)
		diagg = math.sqrt(lpxx*lpxx + lpzz*lpzz)
		angg = App:acos1(lpxx, 0.0, lpzz, 0.0)
		models[16]:SetPosition(setScale*diagg*math.sin(math.pi *(angg+yrot1)/180.0)+xmov, setScale*lpyy+ymov, setScale*diagg*math.cos(math.pi * (angg+yrot1)/180.0)+zmov)
		xrott = models[16]:GetRotation()[0] + xrot1
		yrott = models[16]:GetRotation()[1] + yrot1
		zrott = models[16]:GetRotation()[2] + zrot1
		models[16]:SetRotation(xrott, yrott, zrott)
		models[16]:SetScale(setScale, setScale, setScale)

		------vMesh_003
		qw = virtwquat[17][CurFrame]
		qx = virtxquat[17][CurFrame]
		qy = virtyquat[17][CurFrame]
		qz = virtzquat[17][CurFrame]
		lpxx = virtxpos[17][CurFrame]
		lpyy = virtypos[17][CurFrame]
		lpzz = virtzpos[17][CurFrame]
		setScale = 15
		local quat = Quat(qx, qy, qz, -qw)
		models[17]:SetQuaternion(quat, true)
		diagg = math.sqrt(lpxx*lpxx + lpzz*lpzz)
		angg = App:acos1(lpxx, 0.0, lpzz, 0.0)
		models[17]:SetPosition(setScale*diagg*math.sin(math.pi *(angg+yrot1)/180.0)+xmov, setScale*lpyy+ymov, setScale*diagg*math.cos(math.pi * (angg+yrot1)/180.0)+zmov)
		xrott = models[17]:GetRotation()[0] + xrot1
		yrott = models[17]:GetRotation()[1] + yrot1
		zrott = models[17]:GetRotation()[2] + zrot1
		models[17]:SetRotation(xrott, yrott, zrott)
		models[17]:SetScale(setScale, setScale, setScale)

		------vMesh_002
		qw = virtwquat[18][CurFrame]
		qx = virtxquat[18][CurFrame]
		qy = virtyquat[18][CurFrame]
		qz = virtzquat[18][CurFrame]
		lpxx = virtxpos[18][CurFrame]
		lpyy = virtypos[18][CurFrame]
		lpzz = virtzpos[18][CurFrame]
		setScale = 15
		local quat = Quat(qx, qy, qz, -qw)
		models[18]:SetQuaternion(quat, true)
		diagg = math.sqrt(lpxx*lpxx + lpzz*lpzz)
		angg = App:acos1(lpxx, 0.0, lpzz, 0.0)
		models[18]:SetPosition(setScale*diagg*math.sin(math.pi *(angg+yrot1)/180.0)+xmov, setScale*lpyy+ymov, setScale*diagg*math.cos(math.pi * (angg+yrot1)/180.0)+zmov)
		xrott = models[18]:GetRotation()[0] + xrot1
		yrott = models[18]:GetRotation()[1] + yrot1
		zrott = models[18]:GetRotation()[2] + zrot1
		models[18]:SetRotation(xrott, yrott, zrott)
		models[18]:SetScale(setScale, setScale, setScale)

		------vMesh_001
		qw = virtwquat[19][CurFrame]
		qx = virtxquat[19][CurFrame]
		qy = virtyquat[19][CurFrame]
		qz = virtzquat[19][CurFrame]
		lpxx = virtxpos[19][CurFrame]
		lpyy = virtypos[19][CurFrame]
		lpzz = virtzpos[19][CurFrame]
		setScale = 15
		local quat = Quat(qx, qy, qz, -qw)
		models[19]:SetQuaternion(quat, true)
		diagg = math.sqrt(lpxx*lpxx + lpzz*lpzz)
		angg = App:acos1(lpxx, 0.0, lpzz, 0.0)
		models[19]:SetPosition(setScale*diagg*math.sin(math.pi *(angg+yrot1)/180.0)+xmov, setScale*lpyy+ymov, setScale*diagg*math.cos(math.pi * (angg+yrot1)/180.0)+zmov)
		xrott = models[19]:GetRotation()[0] + xrot1
		yrott = models[19]:GetRotation()[1] + yrot1
		zrott = models[19]:GetRotation()[2] + zrot1
		models[19]:SetRotation(xrott, yrott, zrott)
		models[19]:SetScale(setScale, setScale, setScale)		
end

function App:InitAnimSummaryVirt()

	minnFrameVirt[1]=3
	maxxFrameVirt[1]=32
	actNameVirt[1]="virtrun"
	minnFrameVirt[2]=41
	maxxFrameVirt[2]=81
	actNameVirt[2]="virtmove"
	minnFrameVirt[3]=82
	maxxFrameVirt[3]=142
	actNameVirt[3]="virtputitem"
	minnFrameVirt[4]=143
	maxxFrameVirt[4]=203
	actNameVirt[4]="virtcrawl"
	minnFrameVirt[5]=204
	maxxFrameVirt[5]=264
	actNameVirt[5]="virtsitsurrender"
	minnFrameVirt[6]=265
	maxxFrameVirt[6]=355
	actNameVirt[6]="virtsitfall"
	minnFrameVirt[7]=356
	maxxFrameVirt[7]=446
	actNameVirt[7]="virtupfall"
	minnFrameVirt[8]=447
	maxxFrameVirt[8]=487
	actNameVirt[8]="virtstepright"
	minnFrameVirt[9]=488
	maxxFrameVirt[9]=538
	actNameVirt[9]="virtstepleft"
	minnFrameVirt[10]=539
	maxxFrameVirt[10]=609
	actNameVirt[10]="virtcheckright"
	minnFrameVirt[11]=610
	maxxFrameVirt[11]=660
	actNameVirt[11]="virtcheckleft"
	minnFrameVirt[12]=661
	maxxFrameVirt[12]=791
	actNameVirt[12]="virthack"
	minnFrameVirt[13]=792
	maxxFrameVirt[13]=912
	actNameVirt[13]="virtscan"
	minnFrameVirt[14]=913
	maxxFrameVirt[14]=963
	actNameVirt[14]="virtkick"
	minnFrameVirt[15]=964
	maxxFrameVirt[15]=1064
	actNameVirt[15]="virtraskolbas"
	minnFrameVirt[16]=1065
	maxxFrameVirt[16]=1125
	actNameVirt[16]="virtstaystill"
	minnFrameVirt[17]=1126
	maxxFrameVirt[17]=1166
	actNameVirt[17]="virtsitstill"
end

function App:acos1(x11, x22, y11, y22)

	local coef = 0.0
	-- REFERENCE FUCTIONS FOR ANGLE
	local asn = 180.0/ math.pi * math.asin((x11 - x22)/math.sqrt((x11 - x22)*(x11 - x22) + (y11 - y22)*(y11 - y22)))
	local acs = 180.0/ math.pi * math.acos((y11 - y22)/math.sqrt((x11 - x22)*(x11 - x22) + (y11 - y22)*(y11 - y22)))
	
	if (asn < 0.0)
	then
		coef = 360.0 - acs
	else
		coef = acs
	end

	return coef
end