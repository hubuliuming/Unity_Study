Shader "Unlit/SimpleSurfaceS"
{
    Properties
    {
        
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct VertexInput
            {
                float4 vertex : POSITION;
                float4 normal : NORMAL;
            };
             struct VertexOutput
            {
                float4 posCS : SV_POSITION;
                float4 posWS : TEXCOORD0;
                float3 nDirW : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                o.posCS = UnityObjectToClipPos(v.vertex);
                o.posWS = mul(unity_ObjectToWorld,v.vertex);
                o.nDirW = UnityObjectToWorldNormal(v.normal);
                return o;
            }
             float4 frag(VertexOutput i) : COLOR
            {
                //return float4(finalRGB,1.0);
                return float4(1.0,1.0,1.0,1.0);
            }
            ENDCG
        }
    }
}
