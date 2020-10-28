Shader "Custom/Pescado" {
	Properties {
		_Ambientecito("Color ambiente", Color) = (1, 1, 1, 1)
	}
	SubShader
    {
		Tags{
			"RenderType" = "transparent"
		}
        Pass {

        CGPROGRAM

        #pragma vertex vert
        #pragma fragment frag

        float4 _Ambientecito;
        
        struct vertexInput {
            float4 vertex : POSITION;
        };

		struct vertexOutput {
			float4 pos : SV_POSITION;
		};

		vertexOutput vert (vertexInput v){
			vertexOutput o; 
			o.pos = UnityObjectToClipPos(v.vertex);

			float3 wordlPos = mul(unity_ObjectToWorld, v.vertex).xyz;
			o.pos.y += sin(wordlPos.x + _Time.w);
			return o;
		}


        float4 frag(vertexInput IN) : COLOR{
            return _Ambientecito;
        }

        ENDCG
        }
    }
    FallBack "Diffuse"
}
