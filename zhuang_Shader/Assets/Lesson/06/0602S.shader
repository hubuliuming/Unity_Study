Shader "Unlit/0602S"
{
    Properties
    {
        //_MainCol ("颜色",color) = (1.0,1.0,1.0,1.0)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Pass
        { 
            Name "FORWARD"
            Tags{
                "LightMode" = "ForwardBase"    
            }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            #include "UnityCG.cginc"
            //float3 _MainCol;
            
            struct VertexInput
            {
                float4 vertex : POSITION;
                float4 normal : NORMAL;
            };
            struct VertexOutput
            {
                float4 posCS : SV_POSITION;
                float4 posWS : TEXCOORD0;
                float3 nDirWS : TEXCOORD1; //法线方向
            };
            
            VertexOutput vert(VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                o.posCS = UnityObjectToClipPos(v.vertex);
                o.posWS = mul(unity_ObjectToWorld,v.vertex);
                o.nDirWS = UnityObjectToWorldNormal(v.normal);
                return o;
            }
            
            float4 frag(VertexOutput i ) : COLOR
            {
                //准备变量
                 float3 lDir = _WorldSpaceLightPos0.xyz;
                 float3 nDir = i.nDirWS;
                 float lDotn = dot(lDir,nDir);
                 float lambert = max(lDotn,0);
                return float4(lambert,lambert,lambert,1.0);
                //return float4(1.0,1.0,1.0,1.0);
            } 
         
            ENDCG
        }
    }
}
