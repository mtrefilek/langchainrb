# frozen_string_literal: true

module Langchain::LLM
  class AwsTitanResponse < BaseResponse
    def embedding
      embeddings&.first
    end

    def embeddings
      [raw_response.dig("embedding")]
    end

    def prompt_tokens
      raw_response.dig("inputTextTokenCount")
    end

    def completions
      raw_response.dig("results")
    end

    def completion
      completions&.dig(0, "outputText")
    end
  end
end
