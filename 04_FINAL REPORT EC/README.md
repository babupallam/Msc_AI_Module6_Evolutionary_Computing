# **Final Report on Evolutionary Computing (EC)**
## **MSc AI - De Montfort University**
### **Author:** Babu Pallam (P2849288)

## **1. Introduction**
This repository contains the final report and associated implementation files for **Evolutionary Computing (EC)** as part of the MSc Artificial Intelligence program at **De Montfort University**. The project focuses on the application of **Genetic Algorithm (GA), Particle Swarm Optimization (PSO), and Differential Evolution (DE)** for solving **constrained and unconstrained optimization problems**.

## **2. Repository Structure**
```
FINAL_REPORT_EC/
│── ARC/
│   ├── 01_Uncon_RosenBrock_RGA
│   ├── 02_Uncon_RosenBrock_PSO
│   ├── 03_Uncon_RosenBrock_DE
│   ├── 04_Con_Himmelblau_RGA
│   ├── 05_Con_Himmelblau_PSO
│── helpfulResources/
│── Week 1 Code/
│── Week 2 Code/
│── Week 3 Code/
│── EC REPORT.zip
│── Template Based on Tutorial.docx
│── FINAL_REPORT_EC_BABUPALLAM_P2849288.pdf
│── README.md
```
### **2.1. Folder Descriptions**
- **ARC/**: Contains implementations of optimization problems using different evolutionary algorithms.
- **helpfulResources/**: Additional research materials and references used in the project.
- **Week 1 Code/**: Implementation of binary genetic algorithms and initial evolutionary computation techniques.
- **Week 2 Code/**: Implementation of real-coded GA, PSO, and DE applied to optimization problems.
- **Week 3 Code/**: Advanced optimization techniques including constraint handling and hybrid approaches.
- **EC REPORT.zip**: Contains compressed files of all necessary reports, implementations, and documentation.
- **Template Based on Tutorial.docx**: A reference document used for structuring the report.
- **FINAL_REPORT_EC_BABUPALLAM_P2849288.pdf**: The complete final report detailing problem formulation, methodology, implementation, and analysis.

---

## **3. Project Overview**
### **3.1. Problem Description**
This study applies **Genetic Algorithm (GA), Particle Swarm Optimization (PSO), and Differential Evolution (DE)** to **solve benchmark mathematical optimization problems**, specifically:
1. **Rosenbrock Function** - Unconstrained Optimization Problem
2. **Himmelblau Function** - Constrained Optimization Problem

### **3.2. Algorithms Implemented**
- **Genetic Algorithm (GA)**: Inspired by Darwinian evolution, GA uses selection, crossover, and mutation to evolve solutions.
- **Particle Swarm Optimization (PSO)**: Mimics social behavior of birds flocking towards an optimal solution.
- **Differential Evolution (DE)**: Utilizes mutation and crossover operations to optimize real-valued problems.

---

## **4. Investigations and Observations**
The performance of GA, PSO, and DE is analyzed based on:
- **Benchmark Tests**: Performance evaluation using standard test functions.
- **Parameter Tuning**: Influence of population size, mutation rates, and selection mechanisms.
- **Comparison of Algorithms**: Strengths and weaknesses of each algorithm.

### **4.1. Results**
1. **RGA (Real Genetic Algorithm) Performance**
   - Convergence of solutions to optimal values
   - Effectiveness of selection and mutation strategies
2. **PSO Performance**
   - Effect of inertia weight and acceleration coefficients
   - Faster convergence but higher sensitivity to parameter tuning
3. **DE Performance**
   - Impact of mutation and crossover strategies
   - Best performance for constrained problems

---

## **5. Key Findings and Further Research**
### **5.1. Key Findings**
- GA is **robust but slower** for convergence.
- PSO provides **fast convergence** but struggles with complex constraints.
- DE exhibits **superior performance** in constrained optimization.

### **5.2. Areas for Further Research**
- Hybrid algorithms combining GA, PSO, and DE.
- Implementation of adaptive parameter tuning.
- Application to real-world engineering optimization problems.

---

## **6. Setup and Execution**
### **6.1. Software Requirements**
- **MATLAB** (Recommended: MATLAB R2023a)
- Python (for additional simulations)
- GitHub (for version control)

### **6.2. Running the Code**
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/FINAL_REPORT_EC.git
   ```
2. Navigate to the implementation folder:
   ```bash
   cd FINAL_REPORT_EC/Week_1_Code
   ```
3. Run MATLAB scripts for simulations:
   ```matlab
   run('GeneticAlgorithm.m')
   run('PSO_Implementation.m')
   run('DE_Optimization.m')
   ```
4. Modify parameters in the script to observe different behaviors.

---

## **7. Conclusion**
This project successfully applied **Evolutionary Computing techniques** to **solve constrained and unconstrained optimization problems**. The analysis demonstrated the efficiency of **GA, PSO, and DE**, highlighting their respective advantages and limitations. Future work includes further fine-tuning of these algorithms and exploring hybrid approaches.

---
### **8. References**
- Holland, J. H. (1962). Outline for a logical theory of adaptive systems.
- Eberhart, R., & Kennedy, J. (1995). Particle Swarm Optimization.
- Storn, R. (1997). Differential Evolution – A Simple and Efficient Adaptive Scheme.

---

## **9. Author and Acknowledgments**
**Author:** *Babu Pallam (P2849288)*  
**Supervisor:** *Dr. Zacharias Anastassi*  
**Institution:** *De Montfort University, MSc AI*  
**Date:** *May 2024*

---
