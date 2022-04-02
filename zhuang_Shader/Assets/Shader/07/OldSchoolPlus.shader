Shader "Unlit/OldSchoolPlus"
{
    Properties
    {
        _BaseCol ("基础颜色",color) = (1.0,1.0,1.0,1.0)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

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
                float4 vertex : POSITION; //将模型顶点信息输入进来
                float4 normal : NORMAL;   //讲模型法线信息输入进来
            };
            
            struct VertexOutput
            {
                float4 pos : SV_POSITION;
                float3 normalDir : TEXCOORD0;
            };

            VertexOutput vert(VertexInput v)
            {
                VertexOutput o = (VertexOutput)0;
                
            }
            
            ENDCG
        }
    }
}
