class Nextflow < Formula
  desc "Nextflow is a data-driven workflow management system"
  homepage "https://www.nextflow.io"
  url "https://github.com/nextflow-io/nextflow/archive/refs/tags/v24.10.6.tar.gz"  # Change this to the latest release tarball or your desired version
  sha256 "44cc7826b9f2bd41047104d8583420b5d946a7cc2c6721e38145a8f2f97f53e0"  # Replace with correct sha256 for the tarball

  # Define dependencies
  depends_on "openjdk@21"
  depends_on "lua"

  def install
    system "make", "compile" 
    system "make", "pack"
    # Install the Nextflow executable
    bin.install "build/releases/nextflow-24.10.6-dist" => "nextflow"
  end

  test do
    # Run a basic test to verify the installation
    system "#{bin}/nextflow", "info"
  end
end

