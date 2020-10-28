Shader "ClaseCG/Shadercito"
{
    Properties
    {
        _Ambientecito("Color ambiente", Color) = (1, 1, 1, 1)
        _Difusito("Color difuso", Color) = (1, 0, 0, 1)
        _Especularcito("Color especular", Color) = (1, 1, 1, 1)
        _Brillito("Coeficiente de brillo", Float) = 10
    }
        SubShader
    {
        Pass {

        CGPROGRAM

        #pragma vertex vert
        #pragma fragment frag

        uniform float4 _Ambientecito;
        
        struct vInput {
            float4 pos : POSITION;
            float3 normal : NORMAL;
        };

        float4 vert(vInput input) : SV_POSITION {

            float3 ver = input.pos.xyz + input.normal.xyz * (_SinTime.z / 60);
            float3 vertex = UnityObjectToClipPos(ver);
            
            float4 positions = UnityObjectToClipPos(input.pos);

            float4 result = float4(vertex,positions.w);
        
            return result;
        }


        float4 frag() : COLOR {
            return _Ambientecito;
        }

        ENDCG
        }
    }
    FallBack "Diffuse"
}
