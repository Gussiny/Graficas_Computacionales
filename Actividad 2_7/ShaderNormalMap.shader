Shader "ClaseCG/ShaderNormalMap"
{
    Properties
    {
        _Ambientecito("Color ambiente", Color) = (1, 1, 1, 1)
        _Difusito("Color difuso", Color) = (1, 0, 0, 1)
        _Especularcito("Color especular", Color) = (1, 1, 1, 1)
        _Brillito("Coeficiente de brillo", Float) = 10
        _Profundidad("Profundidad", Range(-2.0, 2.0)) = 1
        _Texturita("Textura", 2D) = "white" {}
        _NormalTex("Normal Tex", 2D) = "bump" {}
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
        uniform float4 _Especularcito;
        uniform float _Brillito;
        uniform float4 _LightColor0;
        uniform sampler2D _Texturita;
        uniform sampler2D _NormalTex;
        uniform float _Profundidad;

        struct vInput {
            float4 pos : POSITION;
            float3 normal : NORMAL;
            float4 texcoord : TEXCOORD0;
            float4 tangent : TANGENT;
        };

        struct vOutput {

            float3 v : TEXCOORD1;
            float4 pos : SV_POSITION;

            float3 normal : NORMAL;
            float4 tex : TEXCOORD0;
            float3 normalWorld : TEXCOORD2;
            float3 tangentWorld : TEXCOORD3;
            float3 binomialWorld : TEXCOORD4;
        };

        vOutput vert(vInput input) {

            float4 result = UnityObjectToClipPos(input.pos);

            vOutput resultado;
            resultado.pos = result;
            resultado.normal = input.normal;
            resultado.tex = input.texcoord;

            float3 vertexGlobal = mul(input.pos, unity_ObjectToWorld).xyz;
            float3 haciaVista = _WorldSpaceCameraPos - vertexGlobal;
            resultado.v = normalize(haciaVista);

            resultado.normalWorld = normalize(mul(float4(input.normal, 0.0), unity_WorldToObject).xyz);
            resultado.tangentWorld = normalize(mul(unity_ObjectToWorld, input.tangent));
            resultado.binomialWorld = normalize(cross(resultado.normalWorld, resultado.tangentWorld) * input.tangent.w);

            return resultado;

        }

        float4 frag(vOutput input) : COLOR{

            float4 tex = tex2D(_Texturita, input.tex.xy);
            float4 texN = tex2D(_NormalTex, input.tex.xy);
            float3 localCoord = float3(2.0 * texN.ag - float2(1.0,1.0), 0.0);
            localCoord.z = _Profundidad;

            float3x3 local2WorldTranspose = float3x3(
                input.tangentWorld,
                input.binomialWorld,
                input.normalWorld
            );

            
            float3 normalDir = normalize(mul(localCoord, local2WorldTranspose));

            // Ambiental : ka * ia
            float4 ambiental = float4(0, 0, 0, 0);
            ambiental = _Ambientecito * _LightColor0 * 0.2;

            float3 l = normalize(_WorldSpaceLightPos0.xyz);

            float3 n = normalize(mul(float4(normalDir, 0), unity_WorldToObject));

            float productito = max(0.0, dot(l, normalDir));

            float4 difuso = float4(0, 0, 0, 0);
            difuso = _Difusito * productito * _LightColor0;

            float4 especular = float4(0, 0, 0, 0);

            float3 v = input.v;
            float3 r = reflect(-l, normalDir);
            float productote = max(0.0, dot(v, r));

            especular = _Especularcito * pow(productote, _Brillito) * _LightColor0;
           

            return (ambiental + difuso + especular) * tex;

        }

        ENDCG
        }
    }
    FallBack "Diffuse"
}
