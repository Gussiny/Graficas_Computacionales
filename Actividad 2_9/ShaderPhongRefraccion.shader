Shader "ClaseCG/ShaderPhongRefraccion"
{
    Properties
    {
        _Ambientecito("Color ambiente", Color) = (1, 1, 1, 1)
        _Difusito("Color difuso", Color) = (1, 0, 0, 1)
        _Especularcito("Color especular", Color) = (1, 1, 1, 1)
        _Brillito("Coeficiente de brillo", Float) = 10
        _Texturita("Textura", 2D) = "white" {}
		_Box("Skybox", Cube) = ""
        _Coeficiente("coeficiente de refraccion", Float) = 0.5
    }
        SubShader
    {
        Pass {

        CGPROGRAM

        #pragma vertex vert
        #pragma fragment frag

        #include "UnityCG.cginc"

        uniform float4 _Ambientecito;
        uniform float4 _Difusito;
        uniform float4 _LightColor0;
        uniform sampler2D _Texturita;
        uniform float _Brillito;
        uniform float4 _Especularcito;
		uniform samplerCUBE _Box;
		uniform float _Coeficiente;
        
        struct vInput {
            float4 pos : POSITION;
            float3 normal : NORMAL;
            float4 texcoord : TEXCOORD0;
        };

        struct vOutput {
            float4 pos : SV_POSITION;
            float3 normal : NORMAL;
            float3 vNormal : TEXCOORD0;
            float3 vVista : TEXCOORD1;
        };

        vOutput vert(vInput input) {

            float4 result = UnityObjectToClipPos(input.pos);

            vOutput resultado;
			
            resultado.pos = result;
            resultado.normal = input.normal;
			resultado.vNormal = normalize(mul(float4(input.normal, 0.0), unity_WorldToObject).xyz);
			resultado.vVista = mul(unity_ObjectToWorld, input.pos).xyz - _WorldSpaceCameraPos;

            return resultado;

        }

        float4 frag(vOutput input) : COLOR{

            float4 ambiental = float4(0, 0, 0, 0);
            ambiental = _Ambientecito * _LightColor0 * 0.5;

            float3 l = normalize(_WorldSpaceLightPos0.xyz);
            float3 n = normalize(mul(float4(input.normal, 0), unity_WorldToObject));

            float4 difuso = float4(0, 0, 0, 0);
            difuso = _Difusito * _LightColor0 * max(0.0, dot(n, l));
  
            float4 especular = float4(0, 0, 0, 0); 
            float3 r = normalize(reflect(-l,n));
            float3 v = normalize(_WorldSpaceLightPos0.xyz - input.pos.xyz);
            especular = _Especularcito * _LightColor0 * pow(max(0.0, dot(v, r)), _Brillito);

			float3 direccionRefraccion = refract(input.vVista, input.vNormal, _Coeficiente);
            
            return (ambiental + difuso + especular) * texCUBE(_Box, direccionRefraccion) * 0.5;
        }

        ENDCG
        }
    }
    FallBack "Diffuse"
}
