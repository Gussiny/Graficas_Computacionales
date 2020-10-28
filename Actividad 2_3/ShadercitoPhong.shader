Shader "ClaseCG/ShadercitoPhong"
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

        // definir 2 shaders
        // vertex shader 
        // fragment shader

        // hay que avisarle al compilador como se llaman
        #pragma vertex vert
        #pragma fragment frag

        #include "UnityCG.cginc"

        // cuando recibamos variables del exterior hay que declarar
        // una variable local del mismo nombre con el modificador uniform
        uniform float4 _Ambientecito;
        uniform float4 _Difusito;
        uniform float4 _LightColor0;
        
        // como definir varios valores de entrada
        // struct - como un objeto pero mas elemental, sólo datos
        struct vInput {
            float4 pos : POSITION;
            // vector normal - vector que apunta hacia "adelante" o
            // "afuera"
            // chequen normalize
            float3 normal : NORMAL;
        };

        struct vOutput {

            // cosas que regresar:
            // - posición modificada
            float4 pos : SV_POSITION;

            // - normal
            float3 normal : NORMAL;
        };

        // float4 - vector tamaño 4 de floats
        // existen los tipos regulares 
        // SEMANTICS - le indican a GPU como interpretar un dato
        // vertex shader - regresa posición con modificación
        vOutput vert(vInput input) {

            //float4 modPos = float4(input.pos.x, input.pos.y, input.pos.z, input.pos.w);
            float4 result = UnityObjectToClipPos(input.pos);
            // como acceder a elementos de vectores
            // result.x, result.y, result.z 
            // result.xy, result.xyz
            // result.r, result.g, result.b
            // result.rg, result.rgb

            // sin(), cos()
            vOutput resultado;
            resultado.pos = result;
            resultado.normal = input.normal;

            return resultado;

            //return result;
        }

        // fragment shader - regresa un color de un fragmento
        float4 frag(vOutput input) : COLOR{

            // Ambiental : ka * ia
            float4 ambiental = float4(0, 0, 0, 0);
            ambiental = _Ambientecito * _LightColor0 * 0.5;

            // Difuso : kd (L . N) id
            // L - vector que va en dirección de la luz
            float3 l = normalize(_WorldSpaceLightPos0.xyz);

            // N - vector normal
            // la multiplicación es de un vector (normal) por una matriz
            // para cambiar el espacio de las coordenadas
            float3 n = normalize(mul(float4(input.normal, 0), unity_WorldToObject));

            // COSAS POR HACER:
            // dot() - método para producto punto
            // resultado puede ser negativo
            // max() - te da el valor máximo entre 2 parámetros (hint: uno es cero)

            ;


            float4 difuso = float4(0, 0, 0, 0);
            difuso = _Difusito * _LightColor0 * max(0.0, dot(n, l));

            // Especular : ks (R . V)**a is
            float4 especular = float4(0, 0, 0, 0);

            return ambiental + difuso + especular;
        }

        ENDCG
        }
    }
    FallBack "Diffuse"
}
