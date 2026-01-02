'Project : -
'Modul : test graphics d3d7
'date of create : 11.06.2008
'date of change : 11.06.2008

Strict
' don't need everything ;) :
Include "..\..\library.bmx\global.bmx"
Include "..\..\library.bmx\vector.bmx"
Include "..\..\library.bmx\geometry.bmx"
Include "..\..\library.bmx\world.bmx"
Include "..\..\library.bmx\graphics.bmx"



Type _main
	Field wmat:_matrix44=Null'no use
	Field pmat:_matrix44=Null
	Field vmat:_matrix44=Null	
	Field gra:_graphics=Null
	Field cam:_camera=Null
	Field mesh:_mesh=Null
	Method New()
				wmat=New _matrix44
				pmat=New _matrix44
				vmat=New _matrix44				
				gra=New _graphicsd3d7
				gra.init(1024,768,0,0)
				cam=New _camera
				cam.position.set(0,0,-2)
				cam.view.set(0,0,1)'note: this is a 90° fov
				cam.side.set(1,0,0)
				cam.up.set(0,1,0)				
				Local gg:_geometrygrid=New _geometrygrid'only used for mesh construction
				gg.position.set(0,0,0)
				gg.color.set(1,1,1,1)
				gg.vx.set(1,0,0)
				gg.vy.set(0,1,0)
				mesh=gg.Create()
				mesh.twosided(True)
				mesh.cull(False)		
				mesh.blend(True)
				mesh.blendadditive(False)				
				EndMethod
	Method transform()	
				cam.loadmatrix(vmat,pmat)
				gra.setmatrixprojection(pmat)
				gra.setmatrixview(vmat)
				gra.setmatrixworld(wmat)'ident-matrix, not used				
				EndMethod				
	Method loop()
				 Local o0:_vector3=New _vector3
				 Local o1:_vector3=New _vector3
				 Local color:_vector4=New _vector4
				 o0.set(0,-1,0)
				 o1.set(1,-1,0)
				 color.set(1,1,0,1)
				
				Repeat
				 gra.clear()
				 transform()
				 'draw something : 
				 gra.line(o0,o1,color)
			     'or :
				 mesh.draw(gra,cam)	
_graphicsd3d7(gra).device.SetTexture(0,Null)
				
				 gra.swap()
				Until GetChar()=KEY_ESCAPE
				EndMethod				
	EndType				
				
Global m:_main=New _main		
m.loop()		
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
   					